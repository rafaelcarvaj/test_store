defmodule TestPeiky.Repo.Migrations.CreateTableCountries do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:countries) do
      add(:name, :string, null: false)
      add(:code, :string, null: false)
      add(:dial_code, :string, null: false)
      add(:enabled, :boolean, default: false)

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:countries))
  end
end
