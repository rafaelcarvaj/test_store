defmodule TestPeikyWeb.DocumentType do
  @moduledoc """
  Declare schema for DocumentType model
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "document_types" do
    field(:name, :string)
    field(:operation_add, :boolean, default: false)

    timestamps()
  end

  @required_attrs [:name, :operation_add]

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_attrs)
    |> validate_required(@required_attrs)
  end
end
