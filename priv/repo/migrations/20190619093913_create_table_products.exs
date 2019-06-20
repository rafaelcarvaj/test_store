defmodule TestPeiky.Repo.Migrations.CreateTableProducts do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:products) do
      add(:ean, :string, null: false)
      add(:name, :string, null: false)
      add(:volume, :decimal)
      add(:weight, :decimal)
      add(:width, :decimal)
      add(:height, :decimal)
      add(:category_id, references(:categories, on_delete: :nothing))

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :products,
        [
          :id,
          :category_id
        ],
        name: :product_category_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :products,
        [
          :id,
          :category_id
        ],
        name: :product_category_index
      )
    )

    drop_if_exists(table(:products))
  end
end
