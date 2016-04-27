defmodule ChildRearingQuestion.CurrentEnqueteListView do
  use ChildRearingQuestion.BaseView

  def render("detail.json", %{data: data}) do
    %{data: data}
  end

  def render("answer.json", %{result: data}) do
    %{result: data}
  end
end
