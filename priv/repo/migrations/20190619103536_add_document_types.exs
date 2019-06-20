defmodule TestPeiky.Repo.Migrations.AddDocumentTypes do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO document_types (id, name, operation_add, inserted_at, updated_at) VALUES
    (1, 'Factura Venta', false, now(), now()),
    (2, 'Factura Compra', true, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM document_types"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE document_types_id_seq RESTART"
    )
  end
end
