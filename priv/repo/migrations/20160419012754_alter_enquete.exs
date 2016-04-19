defmodule ChildRearingQuestion.Repo.Migrations.AlterEnquete do
  use Ecto.Migration

  def change do
    alter table(:enquetes) do
      add :status, :integer, default: 1
    end
  end
end
