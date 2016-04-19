defmodule ChildRearingQuestion.VoteController do
  use ChildRearingQuestion.Web, :controller
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.EnqueteScore

  def vote(conn, _params) do
    # intにキャスト
    {enquete_id, empty} = Integer.parse(_params["enquete_id"])

    enquete_score = Repo.get_by EnqueteScore, enquete_id: enquete_id

    if enquete_score == nil do
      enquete_score = EnqueteScore.changeset(%EnqueteScore{}, %{enquete_id: enquete_id, score: 1})

      Repo.insert(enquete_score)
    else
      update_data = Ecto.Changeset.change enquete_score, score: enquete_score.score + 1

      Repo.update update_data
    end

    conn
    |> render("vote_result.json", data: %{result: "success"})
  end
end
