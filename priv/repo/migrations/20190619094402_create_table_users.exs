defmodule TestPeiky.Repo.Migrations.CreateTableUsers do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:users) do
      add(:name, :string)
      add(:hash_password, :string)
      add(:verified, :boolean, default: false, null: false)
      add(:person_id, references(:persons, on_delete: :nothing))

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :users,
        [
          :name
        ],
        name: :user_name_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :users,
        [
          :name
        ],
        name: :user_name_index
      )
    )

    drop_if_exists(table(:users))
  end
end
