defmodule TestPeiky.Repo.Migrations.CreateTableCustomerProviders do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:customer_provider) do
      add(:person_id, references(:users, on_delete: :nothing))
      add(:enabled, :boolean, default: false)

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :customer_provider,
        [
          :person_id
        ],
        name: :customer_provider_person_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :customer_provider,
        [
          :person_id
        ],
        name: :customer_provider_person_index
      )
    )

    drop_if_exists(table(:customer_provider))
  end
end
