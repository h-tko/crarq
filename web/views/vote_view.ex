defmodule ChildRearingQuestion.VoteView do
  use ChildRearingQuestion.Web, :view

  def render("vote_result.json", %{data: data}) do
    %{result: data.result}
  end
end
