defmodule TestPeiky.Repo.Migrations.CreateTableAddresses do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:addresses) do
      add(:address, :text)
      add(:additional, :text)
      add(:geom, :geometry)
      add(:enabled, :boolean, default: true)
      add(:person_id, references(:persons, on_delete: :nothing))
      add(:store_id, references(:stores, on_delete: :nothing))
      add(:company_id, references(:companies, on_delete: :nothing))
      add(:country_id, references(:countries, on_delete: :nothing))

      timestamps()
    end

    execute("create type address_types as enum ('casa', 'trabajo')")

    alter table(:addresses) do
      add(:address_type, :address_types, default: "casa")
    end
  end

  def down do
    execute("drop type address_types")

    drop(table(:addresses))
  end
end
