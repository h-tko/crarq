defmodule ChildRearingQuestion.EnqueteSelectionTest do
  use ChildRearingQuestion.ModelCase

  alias ChildRearingQuestion.EnqueteSelection

  @valid_attrs %{delete_flg: "some content", enquete_id: "some content", sort: "some content", text: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = EnqueteSelection.changeset(%EnqueteSelection{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = EnqueteSelection.changeset(%EnqueteSelection{}, @invalid_attrs)
    refute changeset.valid?
  end
end
