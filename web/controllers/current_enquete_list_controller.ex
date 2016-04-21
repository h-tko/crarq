defmodule ChildRearingQuestion.CurrentEnqueteListController do
  use ChildRearingQuestion.BaseController
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.Enquete

  def index(conn, _params) do

    current_list = Enquete.get_current_list(Repo)

    data = %{active_tab: "current_enquete", enquete_list: current_list}

    rend conn, "current_enquete_list_index", "index.html", data: data
  end
end
