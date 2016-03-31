defmodule ChildRearingQuestion.PageController do
  use ChildRearingQuestion.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
