defmodule ChildRearingQuestion.TopController do
  use ChildRearingQuestion.BaseController

  def index(conn, _params) do
    rend conn, "top_index", "index.html", data: %{active_tab: "none"}
  end
end
