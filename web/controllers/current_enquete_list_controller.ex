defmodule ChildRearingQuestion.CurrentEnqueteListController do
  use ChildRearingQuestion.BaseController
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.Selection
  alias ChildRearingQuestion.YamlManagerd

  def index(conn, _params) do

    current_list = Enquete.get_current_list(Repo)

    data = %{active_tab: "current_enquete", enquete_list: current_list}

    rend conn, "current_enquete_list_index", "index.html", data: data
  end

  def detail(conn, _params) do

    {enquete_id, _} = Integer.parse(_params["id"])

    category_yml = YamlManager.get("category")

    enquete = Repo.get! Enquete, enquete_id
    selections = Selection.get_list(Repo, enquete.id)

    res_selections = for selection <- selections do
      %{selection_id: selection.id, text: selection.text}
    end

    answered_data = get_session(conn, :answered)

    answered = false

    if answered_data != nil and enquete_id in answered_data do
      answered = true
    end

    data = %{title: enquete.title, description: enquete.description, category: category_yml[Integer.to_string(enquete.category)], selections: res_selections, answered: answered}

    conn
    |> render("detail.json", data: %{enquete: data})
  end

  def answer(conn, _params) do

    {enquete_id, _} = Integer.parse(_params["enquete_id"])
    {selection_id, _} = Integer.parse(_params["selection_id"])

    answered = get_session(conn, :answered)

    if answered != nil do
      if enquete_id in answered do
        conn
        |> render("answer.json", data: %{result: "fail", reason: "すでに回答済みです"})
      else
        answered = [enquete_id] ++ answered
      end
    else
      answered = [enquete_id]
    end

    # 選択肢のデータを取得
    selection = Repo.get_by Selection, id: selection_id

    # ないデータの場合はエラー
    if selection == nil do
      conn
      |> render("answer.json", data: %{result: "fail", reason: "存在しない選択肢です"})
    end

    update_data = Ecto.Changeset.change selection, score: selection.score + 1

    # 更新
    Repo.update update_data

    conn = put_session(conn, :answered, answered)

    conn
    |> render("answer.json", data: %{result: "success"})
  end

  def result(conn, _params) do

    #IDでアンケートを検索
    enquete = Repo.get! Enquete, _params["id"]

    # アンケートIDで選択肢を検索
    selections = Selection.get_list(Repo, enquete.id)

    category = YamlManager.get("category")

    data = %{enquete: enquete, selections: selections, active_tab: "current_enquete", category: category}

    conn
    |> rend("current_enquete_list_result", "result.html", data: data)
  end
end
