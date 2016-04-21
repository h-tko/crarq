defmodule ChildRearingQuestion.CurrentEnqueteListController do
  use ChildRearingQuestion.BaseController
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.Selection
  alias ChildRearingQuestion.YamlManagerd

  def index(conn, _params) do

    current_list = Enquete.get_current_list(Repo)

    data = %{active_tab: "current_enquete", enquete_list: current_list}

    rend conn, "current_enquete_list_index", "index.html", data: data
  end

  def detail(conn, _params) do

    enquete_id = _params["id"]

    category = YamlManager.get("category")
    enquete = Repo.get! Enquete, enquete_id
    selections = Selection.get_list(Repo, enquete.id)

    data = %{active_tab: "current_enquete", enquete: enquete, selections: selections, category: category}

    conn
    |> rend("current_enquete_list_detail", "detail.html", data: data)
  end

  def answer(conn, _params) do

  end
end
