defmodule TestPeiky.Repo.Migrations.CreateTablePeriods do
  use Ecto.Migration

  def up do
    create_if_not_exists table(:periods) do
      add(:period, :string, null: false)
      add(:enabled, :boolean, default: false)

      timestamps()
    end

    create_if_not_exists(
      unique_index(
        :periods,
        [
          :period
        ],
        name: :period_index
      )
    )
  end

  def down do
    drop_if_exists(
      index(
        :periods,
        [
          :period
        ],
        name: :period_index
      )
    )

    drop_if_exists(table(:periods))
  end
end
