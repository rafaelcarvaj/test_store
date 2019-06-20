defmodule TestPeiky.Repo.Migrations.CreateTableOpeningQuantityDetails do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:opening_quantity_details) do
      add(:opening_quantity_id, references(:opening_quantities, on_delete: :nothing))
      add(:warehouse_product_id, references(:warehouse_products, on_delete: :nothing))
      add(:available_quantity, :decimal)

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :opening_quantity_details,
        [
          :opening_quantity_id,
          :warehouse_product_id
        ],
        name: :opening_quantity_details_wh_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :opening_quantity_details,
        [
          :opening_quantity_id,
          :warehouse_product_id
        ],
        name: :opening_quantity_details_wh_index
      )
    )

    drop_if_exists(table(:opening_quantity_details))
  end
end
