defmodule ChildRearingQuestion.EnqueteScore do
  use ChildRearingQuestion.Web, :model

  @primary_key {:enquete_id, :integer, []}
  schema "enquete_score" do
    field :score, :integer
    field :delete_flg, :string

    timestamps
  end

  @required_fields ~w(enquete_id)
  @optional_fields ~w(score delete_flg)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
