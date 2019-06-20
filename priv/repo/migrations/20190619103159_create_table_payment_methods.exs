defmodule TestPeiky.Repo.Migrations.CreateTablePaymentMethods do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:payment_methods) do
      add(:name, :string)

      timestamps()
    end
  end

  def down do
    drop_if_exists(table(:payment_methods))
  end
end
