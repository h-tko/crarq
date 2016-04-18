defmodule ChildRearingQuestion.VoteController do
  use ChildRearingQuestion.Web, :controller
  alias ChildRearingQuestion.EnqueteScore

  def vote(conn, _params) do
    {enquete_id, empty} = Integer.parse(_params["enquete_id"])

    enquete_score = ChildRearingQuestion.Repo.get_by EnqueteScore, enquete_id: enquete_id

    if enquete_score == nil do
      enquete_score = EnqueteScore.changeset(%EnqueteScore{}, _params)

      ChildRearingQuestion.Repo.insert(enquete_score)
    else
      ChildRearingQuestion.Repo.update(enquete_score, inc: [score: 1])
    end

    conn
    |> render("vote_result.json", data: %{result: "success"})
  end
end
