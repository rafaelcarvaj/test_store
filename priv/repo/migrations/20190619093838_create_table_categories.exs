defmodule TestPeiky.Repo.Migrations.CreateTableCategories do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:categories) do
      add(:name, :string, null: false)
      add(:father_category_id, references(:categories, on_delete: :nothing))
      add(:enabled, :boolean, default: false)
      add(:country_id, references(:countries, on_delete: :nothing))

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :categories,
        [
          :id,
          :father_category_id
        ],
        name: :category_father_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :categories,
        [
          :id,
          :father_category_id
        ],
        name: :category_father_index
      )
    )

    drop_if_exists(table(:categories))
  end
end
