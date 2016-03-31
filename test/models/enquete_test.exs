defmodule ChildRearingQuestion.EnqueteTest do
  use ChildRearingQuestion.ModelCase

  alias ChildRearingQuestion.Enquete

  @valid_attrs %{collection_period_date: 42, delete_flg: true, description: "some content", end_date: "2010-04-17", is_request: true, start_date: "2010-04-17", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Enquete.changeset(%Enquete{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Enquete.changeset(%Enquete{}, @invalid_attrs)
    refute changeset.valid?
  end
end
