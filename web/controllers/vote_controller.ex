defmodule ChildRearingQuestion.VoteController do
  use ChildRearingQuestion.BaseController
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.EnqueteScore

  def vote(conn, _params) do
    # intにキャスト
    {enquete_id, _} = Integer.parse(_params["enquete_id"])

    # すでに投票しているかを判定
    vote = get_session(conn, :vote)

    if vote != nil do
      if enquete_id in vote do
        # 投票済みの場合は処理しない
        conn
        |> render("vote_result.json", data: %{result: "fail", reason: "already voted"})
      else
        # 未投票の場合は投票済みリストに追加
        vote = [enquete_id] ++ vote
      end
    else
      # nilの場合は新規作成
      vote = [enquete_id]
    end

    enquete_score = Repo.get_by EnqueteScore, enquete_id: enquete_id

    if enquete_score == nil do
      # レコードがなければinsert
      enquete_score = EnqueteScore.changeset(%EnqueteScore{}, %{enquete_id: enquete_id, score: 1})

      Repo.insert(enquete_score)
    else
      # レコードがあればカウントアップ
      update_data = Ecto.Changeset.change enquete_score, score: enquete_score.score + 1

      Repo.update update_data
    end

    # 投票済みリストをセッションに設定
    conn = put_session(conn, :vote, vote)

    conn
    |> render("vote_result.json", data: %{result: "success"})
  end
end
