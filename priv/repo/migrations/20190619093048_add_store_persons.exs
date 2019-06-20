defmodule TestPeiky.Repo.Migrations.AddStorePersons do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO store_persons (id, store_id, person_id, position_id, enabled, inserted_at, updated_at) VALUES
    (1, 1, 1, 2, true, now(), now()),
    (2, 1, 2, 3, true, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM store_persons"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE store_persons_id_seq RESTART"
    )
  end
end
