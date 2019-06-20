defmodule TestPeiky.Repo.Migrations.AddStores do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO stores (id, name, company_id, time_init, time_end, enabled, inserted_at, updated_at) VALUES
    (1, 'Punto Venta Calle 72', 1, '08:00:00', '18:00:00', true, now(), now()),
    (2, 'Punto Venta Cedritos', 1, '08:00:00', '18:00:00', true, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM stores"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE stores_id_seq RESTART"
    )
  end
end
