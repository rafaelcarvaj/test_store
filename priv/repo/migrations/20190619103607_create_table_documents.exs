defmodule TestPeiky.Repo.Migrations.CreateTableDocuments do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:documents) do
      add(:document_type_id, references(:document_types, on_delete: :nothing))
      add(:total_value, :decimal)
      add(:total_discount, :decimal)
      add(:total_tax, :decimal)
      add(:total_subtotal, :decimal)
      add(:customer_provider_id, references(:customer_provider, on_delete: :nothing))
      add(:reference, :string, null: false)
      add(:user_id, references(:users, on_delete: :nothing))
      add(:payment_method_id, references(:payment_methods, on_delete: :nothing))
      add(:stored_id, references(:stores, on_delete: :nothing))
      add(:observations, :string, null: false)

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:documents))
  end
end
