defmodule TestPeiky.Repo.Migrations.CreateTableDocumentTypes do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:document_types) do
      add(:name, :string, null: false)
      add(:operation_add, :boolean, default: false)

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:document_types))
  end
end
