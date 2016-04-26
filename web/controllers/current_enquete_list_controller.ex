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

    category_yml = YamlManager.get("category")

    enquete = Repo.get! Enquete, enquete_id
    selections = Selection.get_list(Repo, enquete.id)

    res_selections = for selection <- selections do
      %{selection_id: selection.id, text: selection.text}
    end

    data = %{title: enquete.title, description: enquete.description, category: category_yml[Integer.to_string(enquete.category)], selections: res_selections}

    conn
    |> render("detail.json", data: %{enquete: data})
  end

  def answer(conn, _params) do

  end
end
