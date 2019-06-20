defmodule TestPeiky.Repo.Migrations.CreateTableStores do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:stores) do
      add(:name, :string)
      add(:company_id, references(:companies, on_delete: :nothing))
      add(:time_init, :time)
      add(:time_end, :time)
      add(:enabled, :boolean, default: false)

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:stores))
  end
end
