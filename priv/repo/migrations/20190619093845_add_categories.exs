defmodule TestPeiky.Repo.Migrations.AddCategories do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO categories (id, name, father_category_id, enabled, country_id, inserted_at, updated_at) VALUES
    (1, 'Tecnologia', null, true, 1, now(), now()),
    (2, 'Libros', null, true, 1, now(), now()),
    (3, 'Ficcion', 2, true, 1, now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM categories"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE categories_id_seq RESTART"
    )
  end
end
