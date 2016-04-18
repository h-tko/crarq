defmodule ChildRearingQuestion.Repo.Migrations.CreateEnqueteScore do
  use Ecto.Migration

  def change do
    create table(:enquete_score, primary_key: false) do
      add :enquete_id, :integer, primary_key: true
      add :score, :integer
      add :delete_flg, :boolean, default: false

      timestamps
    end

  end
end
