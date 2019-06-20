defmodule TestPeiky.Repo.Migrations.CreateTablePositions do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:positions) do
      add(:name, :string)

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:positions))
  end
end
