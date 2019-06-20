defmodule TestPeiky.Repo.Migrations.AddCompanies do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO companies (id, name, website, email, inserted_at, updated_at) VALUES
    (1, 'Peiky SAS', 'https://peiky.com', 'callcenter@peiky.com', now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM companies"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE companies_id_seq RESTART"
    )
  end
end
