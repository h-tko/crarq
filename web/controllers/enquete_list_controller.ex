defmodule ChildRearingQuestion.EnqueteListController do
  use ChildRearingQuestion.Web, :controller
  alias ChildRearingQuestion.YamlManager
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.Selection

  def index(conn, _params) do

    enquete_list = Enquete.get_list(ChildRearingQuestion.Repo)
    data = %{enquete_list: enquete_list, active_tab: "enquete_list"}

    render conn, "index.html", data: data
  end

  def detail(conn, _params) do
    # IDでアンケートを検索
    enquete = ChildRearingQuestion.Repo.get! Enquete, _params["id"]

    # アンケートIDで選択肢を検索
    selections = Selection.get_list(ChildRearingQuestion.Repo, enquete.id)

    data = %{enquete: enquete, selections: selections, active_tab: "enquete_list"}

    conn
    |> render("detail.html", data: data)
  end
end
