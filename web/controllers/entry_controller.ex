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

    changeset = Enquete.changeset(%Enquete{}, enquete_params)

    if changeset.valid? do
      # バリデーションがOKの場合は確認画面
      conn
      |> render("confirm.html", enquete: changeset)
    else
      # バリデーションエラー
      conn
      |> render("index.html", enquete: changeset)
    end
  end
end
