defmodule ChildRearingQuestion.Selection do
  use ChildRearingQuestion.Web, :model

  schema "selections" do
    field :enquete_id, :integer
    field :sort, :integer
    field :score, :integer
    field :text, :string
    field :delete_flg, :string

    timestamps
  end

  @required_fields ~w(enquete_id text)
  @optional_fields ~w(sort score delete_flg)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def create(model, repo) do
    model
    |> repo.insert()
  end

  def get_list(repo, enquete_id) do
    query = from s in ChildRearingQuestion.Selection,
      where: s.enquete_id == ^enquete_id,
      select: s

    query
    |> repo.all
  end
end
