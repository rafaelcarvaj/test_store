defmodule TestPeiky.Repo.Migrations.CreateTableOpeningQuantities do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:opening_quantities) do
      add(:user_id, references(:users, on_delete: :nothing))
      add(:period_id, references(:periods, on_delete: :nothing))
      add(:store_id, references(:stores, on_delete: :nothing))
      add(:note, :string, null: false)

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :opening_quantities,
        [
          :period_id,
          :store_id
        ],
        name: :document_details_product_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :opening_quantities,
        [
          :period_id,
          :store_id
        ],
        name: :document_details_product_index
      )
    )

    drop_if_exists(table(:opening_quantities))
  end
end
