# アンケート登録
defmodule ChildRearingQuestion.EntryController do
  use ChildRearingQuestion.BaseController
  alias ChildRearingQuestion.YamlManager
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.Selection
  require Logger

  def index(conn, _params) do

    enquete = Enquete.changeset(%Enquete{})

    # yamlからカテゴリー情報をとってくる
    category = YamlManager.get("category")

    data = %{enquete: enquete, category: category, active_tab: "entry"}

    rend conn, "entry_index", "index.html", data: data
  end

  def confirm(conn, %{"enquete" => enquete_params}) do

    enquete = Enquete.entry_changeset(%Enquete{}, enquete_params)

    # yamlからカテゴリー情報をとってくる
    category = YamlManager.get("category")

    data = %{enquete: enquete, category: category, selection: enquete_params["selection"], active_tab: "entry"}

    if data.enquete.valid? do
      # バリデーションがOKの場合は確認画面
      conn
      |> rend("entry_confirm", "confirm.html", data: data)
    else
      # バリデーションエラー
      conn
      |> rend("entry_confirm", "index.html", data: data)
    end
  end

  def submit(conn, %{"enquete" => enquete_params}) do

    enquete = Enquete.entry_changeset(%Enquete{}, enquete_params)

    if enquete.valid? do
      # バリデーションがOKの場合登録処理実行
      selections = enquete_params["selection"]

      enquete = Ecto.Changeset.change enquete, status: 1

      # アンケートの登録
      case Enquete.create(enquete, ChildRearingQuestion.Repo) do
        {:ok, _enquete} ->

          # 成功したら選択肢の登録
          for selection <- selections do

            # 登録パラメータ生成
            insert_param = Selection.changeset(%Selection{}, %{enquete_id: _enquete.id, text: selection, score: 0})

            # 登録実行
            case Selection.create(insert_param, ChildRearingQuestion.Repo) do
              {:ok, _selection} ->

                Logger.info "add selection data"

              {:error, insert_param} ->

                raise insert_param
            end

            redirect conn, to: "/"
          end

        {:error, enquete} ->
          conn
          |> rend("entry_submit", "index.html", data: %{enquete: enquete, selection: selections, category: YamlManager.get("category"), active_tab: "entry"})
      end

    else
      # バリデーションエラー
      data = %{enquete: enquete, category: YamlManager.get("category"),  selection: enquete_params["selection"]}

      conn
      |> rend("entry_submit", "index.html", data: data)
    end
  end
end
