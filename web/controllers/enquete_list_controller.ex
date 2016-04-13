defmodule ChildRearingQuestion.EnqueteListController do
  use ChildRearingQuestion.Web, :controller
  alias ChildRearingQuestion.YamlManager
  alias ChildRearingQuestion.Enquete

  def index(conn, _params) do

    enquete_list = Enquete.get_list(ChildRearingQuestion.Repo)

    render conn, "index.html", data: enquete_list
  end
end
