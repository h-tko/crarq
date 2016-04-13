defmodule ChildRearingQuestion.Repo.Migrations.AlterSelections do
  use Ecto.Migration

  def change do
    alter table(:selections) do
      modify :enquete_id, :integer
      modify :sort, :integer
    end
  end
end
