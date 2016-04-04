defmodule ChildRearingQuestion.EntryController do
  use ChildRearingQuestion.Web, :controller
  alias ChildRearingQuestion.YamlManager
  alias ChildRearingQuestion.Enquete

  def index(conn, _params) do

    enquete = Enquete.changeset(%Enquete{})

    # yamlからカテゴリー情報をとってくる
    category = YamlManager.get("category")

    data = %{enquete: enquete, category: category}

    render conn, "index.html", data: data
  end

  def confirm(conn, %{"enquete" => enquete_params}) do

    enquete = Enquete.entry_changeset(%Enquete{}, enquete_params)

    # yamlからカテゴリー情報をとってくる
    category = YamlManager.get("category")

    data = %{enquete: enquete, category: category, selection: enquete_params["selection"]}

    if data.enquete.valid? do
      # バリデーションがOKの場合は確認画面
      conn
      |> render("confirm.html", data: data)
    else
      # バリデーションエラー
      conn
      |> render("index.html", data: data)
    end
  end

  def submit(conn, %{"enquete" => enquete_params}) do

  end
end
