defmodule TestPeikyWeb.DocumentTypeHelper do
  @moduledoc """
  Helpers for DocumentTypes
  """

  alias TestPeikyWeb.DocumentType
  alias TestPeiky.Repo
  import Ecto.Query

  @spec list_document_types(map()) :: {:ok, list(%DocumentType{})}
  def list_document_types(%{"name" => name}) do
    from(dt in DocumentType,
      where: dt.name == ^name
    )
    |> Repo.all()
    |> (&{:ok, &1}).()
  end

  def list_document_types(params)
      when params == %{} do
    DocumentType
    |> Repo.all()
    |> (&{:ok, &1}).()
  end

  def list_document_types(_) do
    {:ok, []}
  end

  @spec get_document_type(map()) :: {:ok, %DocumentType{}}
  def get_document_type(%{"id" => id}) do
    from(dt in DocumentType,
      where: dt.id == ^id
    )
    |> Repo.one()
    |> (&{:ok, &1}).()
  end

  @spec delete_document_type(map()) :: {:ok, %DocumentType{}} | {:ok, nil}
  def delete_document_type(%{"id" => id}) do
    DocumentType
    |> Repo.get(id)
    |> Repo.delete()
    |> case do
      {:ok, _} = resp -> resp
      _ -> {:ok, nil}
    end
  end

  @spec update_document_type(map()) :: {:ok, %DocumentType{}} | {:ok, nil}
  def update_document_type(%{"id" => id, "document_type" => document_type}) do
    document_type_new =
      document_type
      |> Morphix.atomorphiform!()

    DocumentType
    |> Repo.get(id)
    |> DocumentType.changeset(document_type_new)
    |> Repo.update()
    |> case do
      {:ok, _} = resp -> resp
      _ -> {:ok, nil}
    end
  end

  @spec create_document_type(map()) :: {:ok, %DocumentType{}} | {:ok, nil}
  def create_document_type(%{"document_type" => document_type}) do
    document_type_new =
      document_type
      |> Morphix.atomorphiform!()

    %DocumentType{}
    |> DocumentType.changeset(document_type_new)
    |> Repo.insert()
    |> case do
      {:ok, _} = resp -> resp
      _ -> {:ok, nil}
    end
  end
end
