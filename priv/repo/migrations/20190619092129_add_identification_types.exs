defmodule TestPeiky.Repo.Migrations.AddIdentificationTypes do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO identification_types (id, acronym, description, country_id, inserted_at, updated_at) VALUES
    (1, 'CC', 'Cedula Ciudadania', 1, now(), now()),
    (2, 'CE', 'Cedula Extranjeria', 1, now(), now()),
    (3, 'PA', 'Pasaporte', 1, now(), now()),
    (4, 'NI', 'Nit', 1, now(), now()),
    (5, 'PEP', 'Permiso Especial de Permanencia', 1, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM identification_types"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE identification_types_id_seq RESTART"
    )
  end
end
