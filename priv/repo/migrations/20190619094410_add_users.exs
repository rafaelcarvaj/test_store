defmodule TestPeiky.Repo.Migrations.AddUsers do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO users (id, name, hash_password, verified, person_id, inserted_at, updated_at) VALUES
    (1, 'rcarvaja', '$2b$12$O1HDGAskM8.HoAD2bUNeuO15UkXnxTv2rgA71AmsGSTfZA8hNEK/2', true, 1, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM users"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE users_id_seq RESTART"
    )
  end
end
