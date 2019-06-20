defmodule TestPeiky.Repo.Migrations.AddPeriods do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO periods (id, period, enabled, inserted_at, updated_at) VALUES
    (1, '201906', true, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM periods"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE periods_id_seq RESTART"
    )
  end
end
