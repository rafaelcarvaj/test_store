defmodule TestPeiky.Repo.Migrations.AddCountries do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO countries (id, name, code, dial_code, enabled, inserted_at, updated_at) VALUES
    (1, 'Colombia', 'CO', '+57', true, now(), now()),
    (2, 'Estados Unidos', 'US', '+1', true, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM countries"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE countries_id_seq RESTART"
    )
  end
end
