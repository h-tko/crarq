defmodule ChildRearingQuestion.EnqueteScoreTest do
  use ChildRearingQuestion.ModelCase

  alias ChildRearingQuestion.EnqueteScore

  @valid_attrs %{delete_flg: "some content", score: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = EnqueteScore.changeset(%EnqueteScore{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = EnqueteScore.changeset(%EnqueteScore{}, @invalid_attrs)
    refute changeset.valid?
  end
end
