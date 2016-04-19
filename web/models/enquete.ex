defmodule ChildRearingQuestion.Enquete do
  use ChildRearingQuestion.Web, :model
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.EnqueteScore

  schema "enquetes" do
    field :category, :integer
    field :title, :string
    field :description, :string
    field :collection_period_date, :integer
    field :start_date, Ecto.Date
    field :end_date, Ecto.Date
    field :is_request, :boolean, default: false
    field :delete_flg, :boolean, default: false
    field :selection, {:array, :string}, virtual: true

    timestamps
  end

  @required_fields ~w(category title description collection_period_date is_request delete_flg)
  @optional_fields ~w(start_date end_date)
  @entry_validation_fields ~w(category title description collection_period_date selection)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def entry_changeset(model, params \\ :empty) do
    model
    |> cast(params, @entry_validation_fields)
    |> validate_number(:category, greater_than: 0)
    |> validate_length(:title, min: 1)
    |> validate_length(:title, max: 50)
    |> validate_length(:description, max: 300)
    |> validate_length(:selection, min: 1)
  end

  def get_list_with_score(repo) do
    query = from e in Enquete,
      join: es in EnqueteScore, on: e.id == es.enquete_id,
      where: e.delete_flg == false,
      select: {e, es}

    query
    |> repo.all
  end

  def get_with_score(repo, enquete_id) do
    query = from e in Enquete,
      join: es in EnqueteScore, on: e.id == es.enquete_id,
      where: e.delete_flg == false,
      select: {e, es}

    query
    |> repo.all
  end

  def create(model, repo) do
    model
    |> repo.insert()
  end
end
