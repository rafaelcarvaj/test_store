defmodule TestPeiky.Repo.Migrations.AddAddresses do
  use Ecto.Migration
  alias User.Repo
  alias Ecto.Adapters.SQL

  def up do
    execute("""
    INSERT INTO addresses (id, address, additional, geom, enabled, person_id, store_id, company_id, country_id, address_type, inserted_at, updated_at) VALUES
    (1, 'Calle 105 No. 46 - 51', 'Diagonal estacion calle 106', 'POLYGON ((-78.54542894780272 0.003576022838066, -78.4689186916681 0.021539299860308, -78.40371864730989 -0.000415816610111, -78.31390225967358 -0.060293397239753, -78.32787369775035 -0.237264279226349, -78.3504941213032 -0.379637786508181, -78.49153911522093 -0.396270069545828, -78.56804937135557 -0.529992292123533, -78.5946616343589 -0.250570290122072, -78.54542894780272 0.003576022838066))', 
    true, 1, 1, 1, 1, 'casa', now(), now())
    ;
    """)
  end

  def down do
    SQL.query!(
      Repo,
      "DELETE FROM addresses"
    )

    SQL.query!(
      Repo,
      "ALTER SEQUENCE addresses_id_seq RESTART"
    )
  end
end
