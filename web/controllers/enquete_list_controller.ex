defmodule ChildRearingQuestion.EnqueteListController do
  use ChildRearingQuestion.BaseController
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.Selection

  def index(conn, _params) do
    enquete_list = Enquete.get_vote_list_with_score(ChildRearingQuestion.Repo)
    voted_list = get_session(conn, :vote)

    # セッションに投票済みリストがない場合は空のリストを登録
    if voted_list == nil do
      voted_list = []
      conn = put_session(conn, :vote, voted_list)
    end

    data = %{enquete_list: enquete_list, active_tab: "enquete_list", voted_list: voted_list}

    rend conn, "enquete_list_index", "index.html", data: data
  end

  def detail(conn, _params) do
    # IDでアンケートを検索
    enquete = ChildRearingQuestion.Repo.get! Enquete, _params["id"]

    # アンケートIDで選択肢を検索
    selections = Selection.get_list(ChildRearingQuestion.Repo, enquete.id)

    data = %{enquete: enquete, selections: selections, active_tab: "enquete_list"}

    conn
    |> rend("enquete_list_detail", "detail.html", data: data)
  end

end
