defmodule TestPeikyWeb.DocumentTypeControllerTest do
  use TestPeikyWeb.ConnCase

  alias TestPeikyWeb.DocumentTypeController

  @valid_attrs %{name: "Prueba Doc Type", operation_add: false}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all document types", %{conn: conn} do
    conn = get(conn, document_type_path(conn, :index))
    assert json_response(conn, 200)["data"] == []
  end

  test "show document type by id", %{conn: conn} do
    document_type = Repo.insert!(%DocumentType{})
    conn = get(conn, document_type_path(conn, :show, document_type))

    assert json_response(conn, 200)["data"] == %{
             "id" => document_type.id,
             "name" => document_type.name,
             "operation_add" => document_type.operation_add
           }
  end

  test "Document type was not founded when id is nonexistent", %{conn: conn} do
    conn = get(conn, document_type_path(conn, :show, %{"id" => 99_999_999}))

    assert json_response(conn, 200)["data"] == nil
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post(conn, document_type_path(conn, :create), document_type: @valid_attrs)
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(DocumentType, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post(conn, document_type_path(conn, :create), document_type: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    document_type = Repo.insert!(%DocumentType{})

    conn =
      put(conn, document_type_path(conn, :update, document_type), document_type: @valid_attrs)

    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(DocumentType, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    document_type = Repo.insert!(%DocumentType{})

    conn =
      put(conn, document_type_path(conn, :update, document_type), document_type: @invalid_attrs)

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    document_type = Repo.insert!(%DocumentType{})
    conn = delete(conn, document_type_path(conn, :delete, document_type))
    assert response(conn, 204)
    refute Repo.get(DocumentType, document_type.id)
  end
end
