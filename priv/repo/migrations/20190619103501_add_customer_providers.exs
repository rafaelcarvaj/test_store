defmodule TestPeiky.Repo.Migrations.AddCustomerProviders do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO customer_provider (id, person_id, enabled, inserted_at, updated_at) VALUES
    (1, 1, true, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM customer_provider"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE customer_provider_id_seq RESTART"
    )
  end
end
