defmodule ChildRearingQuestion.Enquete do
  use ChildRearingQuestion.Web, :model

  schema "enquetes" do
    field :title, :string
    field :description, :string
    field :collection_period_date, :integer
    field :start_date, Ecto.Date
    field :end_date, Ecto.Date
    field :is_request, :boolean, default: false
    field :delete_flg, :boolean, default: false

    timestamps
  end

  @required_fields ~w(title description collection_period_date is_request delete_flg)
  @optional_fields ~w(start_date end_date)

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
