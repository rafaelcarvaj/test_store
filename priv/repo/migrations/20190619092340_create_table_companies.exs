defmodule TestPeiky.Repo.Migrations.CreateTableCompanies do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:companies) do
      add(:name, :string)
      add(:website, :string)
      add(:email, :string)

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:companies))
  end
end
