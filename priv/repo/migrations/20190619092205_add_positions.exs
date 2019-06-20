defmodule TestPeiky.Repo.Migrations.AddPositions do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO positions (id, name, inserted_at, updated_at) VALUES
    (1, 'Gerente', now(), now()),
    (2, 'Administrador', now(), now()),
    (3, 'Cajero', now(), now()),
    (4, 'Impulsador', now(), now()),
    (5, 'Vigilante', now(), now()),
    (6, 'Aprendiz Sena', now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM positions"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE positions_id_seq RESTART"
    )
  end
end
