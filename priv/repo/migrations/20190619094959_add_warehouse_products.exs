defmodule TestPeiky.Repo.Migrations.AddWarehouseProducts do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO warehouse_products (id, warehouse_id, product_id, avalaible_quantity, enabled, inserted_at, updated_at) VALUES
    (1, 1, 1, 20, true, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM warehouse_products"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE warehouse_products_id_seq RESTART"
    )
  end
end
