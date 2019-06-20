defmodule TestPeiky.Repo.Migrations.CreateTablePersons do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:persons) do
      add(:identification, :string)
      add(:names, :string)
      add(:surnames, :string)
      add(:email, :string)
      add(:identification_type_id, references(:identification_types, on_delete: :nothing))
      add(:company_id, references(:companies, on_delete: :nothing))
      add(:country_id, references(:countries, on_delete: :nothing))
      add(:photo_url, :string)

      timestamps()
    end

    execute("create type person_types as enum ('juridico', 'natural')")

    alter table(:persons) do
      add(:person_type, :person_types, default: "natural")
    end

    create_if_not_exists(
      unique_index(
        :persons,
        [
          :company_id,
          :identification
        ],
        name: :company_identification_index
      )
    )
  end

  def down do
    execute("drop type person_types")

    drop_if_exists(
      index(
        :persons,
        [
          :company_id,
          :identification
        ],
        name: :company_identification_index
      )
    )

    drop_if_exists(table(:persons))
  end
end
