defmodule TestPeiky.Repo.Migrations.CreateTableWarehouses do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:warehouses) do
      add(:store_id, references(:stores, on_delete: :nothing))
      add(:responsable_id, references(:persons, on_delete: :nothing))

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :warehouses,
        [
          :store_id,
          :responsable_id
        ],
        name: :warehouse_user_person_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :warehouses,
        [
          :store_id,
          :responsable_id
        ],
        name: :warehouse_user_person_index
      )
    )

    drop_if_exists(table(:warehouses))
  end
end
