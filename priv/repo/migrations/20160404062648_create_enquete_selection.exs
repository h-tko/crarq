defmodule ChildRearingQuestion.Repo.Migrations.CreateSelection do
  use Ecto.Migration

  def change do
    create table(:selections) do
      add :enquete_id, :string
      add :sort, :string
      add :text, :string
      add :score, :integer, default: 0
      add :delete_flg, :string

      timestamps
    end

  end
end
