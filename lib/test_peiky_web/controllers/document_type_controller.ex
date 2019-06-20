defmodule TestPeikyWeb.DocumentTypeController do
  use TestPeikyWeb, :controller
  alias TestPeikyWeb.DocumentTypeHelper

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"document_type" => _} = params) do
    with {:ok, document_type} <-
           DocumentTypeHelper.create_document_type(params) do
      conn
      |> put_status(:created)
      |> render("show.json", %{document_type: document_type})
    end
  end

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, params) do
    with {:ok, document_types} <-
           DocumentTypeHelper.list_document_types(params) do
      conn
      |> put_status(:ok)
      |> render("index.json", %{document_types: document_types})
    end
  end

  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, %{"id" => _} = params) do
    with {:ok, document_type} <-
           DocumentTypeHelper.get_document_type(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{document_type: document_type})
    end
  end

  @spec update(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def update(conn, %{"id" => _, "document_type" => _} = params) do
    with {:ok, document_type} <-
           DocumentTypeHelper.update_document_type(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{document_type: document_type})
    end
  end

  @spec delete(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def delete(conn, %{"id" => _} = params) do
    with {:ok, document_type} <-
           DocumentTypeHelper.delete_document_type(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{document_type: document_type})
    end
  end
end
