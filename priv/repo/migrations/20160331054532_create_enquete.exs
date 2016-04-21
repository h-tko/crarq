defmodule ChildRearingQuestion.Repo.Migrations.CreateEnquete do
  use Ecto.Migration

  def change do
    create table(:enquetes) do
      add :category, :integer
      add :title, :string
      add :description, :string
      add :collection_period_date, :integer
      add :start_date, :date
      add :end_date, :date
      add :status, :integer, default: 1
      add :is_request, :boolean, default: false
      add :delete_flg, :boolean, default: false

      timestamps
    end

  end
end
