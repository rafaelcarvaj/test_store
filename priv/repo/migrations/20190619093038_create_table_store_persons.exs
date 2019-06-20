defmodule TestPeiky.Repo.Migrations.CreateTableStorePersons do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:store_persons) do
      add(:store_id, references(:stores, on_delete: :nothing))
      add(:person_id, references(:persons, on_delete: :nothing))
      add(:position_id, references(:positions, on_delete: :nothing))
      add(:enabled, :boolean, default: false)

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :store_persons,
        [
          :store_id,
          :person_id
        ],
        name: :store_person_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :store_persons,
        [
          :store_id,
          :person_id
        ],
        name: :store_person_index
      )
    )

    drop_if_exists(table(:store_persons))
  end
end
