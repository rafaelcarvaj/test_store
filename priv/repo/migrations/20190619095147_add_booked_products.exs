defmodule TestPeiky.Repo.Migrations.AddBookedProducts do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO booked_products (id, warehouse_product_id, booked_quantity, user_id, inserted_at, updated_at) VALUES
    (1, 1, 20, 1, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM booked_products"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE booked_products_id_seq RESTART"
    )
  end
end
