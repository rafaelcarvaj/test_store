defmodule TestPeiky.Repo.Migrations.CreateTableIdentificationTypes do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:identification_types) do
      add(:acronym, :string)
      add(:description, :text)
      add(:country_id, references(:countries, on_delete: :nothing))

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:identification_types))
  end
end
