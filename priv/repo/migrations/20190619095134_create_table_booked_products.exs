defmodule TestPeiky.Repo.Migrations.CreateTableBookedProducts do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:booked_products) do
      add(:warehouse_product_id, references(:warehouses, on_delete: :nothing))
      add(:booked_quantity, :decimal)
      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :booked_products,
        [
          :warehouse_product_id
        ],
        name: :booked_warehouse_product_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :booked_products,
        [
          :warehouse_product_id
        ],
        name: :booked_warehouse_product_index
      )
    )

    drop_if_exists(table(:booked_products))
  end
end
