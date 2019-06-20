defmodule TestPeiky.Repo.Migrations.CreateTableDocumentDetails do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:document_details) do
      add(:product_id, references(:products, on_delete: :nothing))
      add(:document_id, references(:documents, on_delete: :nothing))
      add(:quantity, :decimal)
      add(:subtotal, :decimal)
      add(:discount, :decimal)
      add(:tax, :decimal)
      add(:total, :decimal)
    end

    create_if_not_exists(
      unique_index(
        :document_details,
        [
          :product_id,
          :document_id
        ],
        name: :document_details_product_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :document_details,
        [
          :product_id,
          :document_id
        ],
        name: :document_details_product_index
      )
    )

    drop_if_exists(table(:document_details))
  end
end
