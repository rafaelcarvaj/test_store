defmodule TestPeiky.Repo.Migrations.CreatePostgisExtension do
  use Ecto.Migration
  alias Ecto.Adapters.SQL
  alias User.Repo

  def up do
    SQL.query(Repo, "CREATE EXTENSION IF NOT EXISTS 'postgis'")
  end

  def down do
    SQL.query(Repo, "DROP EXTENSION IF EXISTS 'postgis'")
  end
end
