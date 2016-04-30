defmodule ChildRearingQuestion.CurrentEnqueteListView do
  use ChildRearingQuestion.BaseView

  def render("detail.json", %{data: data}) do
    %{data: data}
  end

  def render("answer.json", %{data: data}) do
    %{result: data.result}
  end

  def render("answer.json", %{result: result, reason: reason}) do
    %{result: result, reason: reason}
  end
end
