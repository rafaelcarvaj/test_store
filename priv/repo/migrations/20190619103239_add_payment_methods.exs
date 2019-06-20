defmodule TestPeiky.Repo.Migrations.AddPaymentMethods do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO payment_methods (id, name, inserted_at, updated_at) VALUES
    (1, 'Tarjeta Credito', now(), now()),
    (2, 'Tarjeta Debito', now(), now()),
    (3, 'Cheque Gerencia', now(), now()),
    (4, 'Transferencia Electronica', now(), now()),
    (5, 'Cruce Cuentas', now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM payment_methods"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE payment_methods_id_seq RESTART"
    )
  end
end
