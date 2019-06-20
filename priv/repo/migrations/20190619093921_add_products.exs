defmodule TestPeiky.Repo.Migrations.AddProducts do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO products (id, ean, name, volume, weight, width, height, category_id, inserted_at, updated_at) VALUES
    (1, '978-1-292-16506-6', 'Mouse', 12.20, 20.19, 50.2, 40.98, 2, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM products"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE products_id_seq RESTART"
    )
  end
end
