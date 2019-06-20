defmodule TestPeiky.Repo.Migrations.CreateTableWarehouseProducts do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:warehouse_products) do
      add(:warehouse_id, references(:warehouses, on_delete: :nothing))
      add(:product_id, references(:products, on_delete: :nothing))
      add(:avalaible_quantity, :decimal)
      add(:enabled, :boolean, default: false)

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :warehouse_products,
        [
          :warehouse_id,
          :product_id
        ],
        name: :warehouse_product_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :warehouse_products,
        [
          :warehouse_id,
          :product_id
        ],
        name: :warehouse_product_index
      )
    )

    drop_if_exists(table(:warehouse_products))
  end
end
