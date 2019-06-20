defmodule TestPeiky.Repo.Migrations.AddPersons do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO persons (id, identification, names, surnames, email, identification_type_id, country_id, photo_url, person_type, inserted_at, updated_at) VALUES
    (1, '93234543', 'Ricardo Jose', 'Zerpa Londono', 'rzerpa@test.com', 1, 1, 'https://images.cloud/asqwe110sad112', 'natural', now(), now()),
    (2, 'AR-908009', 'Daniel', 'Cabrera', 'dcabrera@test.com', 2, 1, 'https://images.cloud/sdaderwerrsdas', 'natural', now(), now()),
    (3, 'PA-A-908142', 'Billy', 'Graham', 'bgraham@test.com', 3, 1, 'https://images.cloud/auikuiuiksrsra', 'natural', now(), now()),
    (4, '900000900-1', 'TEST LTDA', '', 'testltda@test.com', 4, 1, 'https://images.cloud/gtdasdyyssdfff', 'juridico', now(), now()),
    (5, 'PEP-A0090898', 'Alimar', 'Perez Santos', 'asantos@test.com', 5, 1, 'https://images.cloud/jkljkksdlkfsdo', 'natural', now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM persons"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE persons_id_seq RESTART"
    )
  end
end
