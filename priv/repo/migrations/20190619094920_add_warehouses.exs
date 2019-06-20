defmodule TestPeiky.Repo.Migrations.AddWarehouses do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO warehouses (id, store_id, responsable_id, inserted_at, updated_at) VALUES
    (1, 1, 1, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM warehouses"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE warehouses_id_seq RESTART"
    )
  end
end
