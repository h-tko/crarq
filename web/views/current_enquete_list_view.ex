defmodule ChildRearingQuestion.CurrentEnqueteListView do
  use ChildRearingQuestion.BaseView

  def render("detail.json", %{data: data}) do
    %{data: data}
  end
end
