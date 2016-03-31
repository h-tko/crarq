defmodule ChildRearingQuestion.EntryController do
  use ChildRearingQuestion.Web, :controller
  alias ChildRearingQuestion.Enquete

  def index(conn, _params) do

    enquete = Enquete.changeset(%Enquete{})

    render conn, "index.html", enquete: enquete
  end

  def confirm(conn, %{"enquete" => enquete_params}) do

    changeset = Enquete.changeset(%Enquete{}, enquete_params)

    if changeset.valid? do
      # バリデーションがOKの場合は確認画面
      conn
      |> render("confirm.html", enquete: changeset)
    else
      # バリデーションエラー
      conn
      |> render("index.html", enquete: changeset)
    end
  end
end
