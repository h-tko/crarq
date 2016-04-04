defmodule ChildRearingQuestion.Selection do
  use ChildRearingQuestion.Web, :model

  schema "selections" do
    field :enquete_id, :string
    field :sort, :string
    field :text, :string
    field :delete_flg, :string

    timestamps
  end

  @required_fields ~w(enquete_id sort text delete_flg)
  @optional_fields ~w()

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
