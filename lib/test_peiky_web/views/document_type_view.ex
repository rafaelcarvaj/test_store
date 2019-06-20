defmodule TestPeikyWeb.DocumentTypeView do
  use TestPeikyWeb, :view

  def render("index.json", %{document_types: document_types}) do
    %{data: render_many(document_types, TestPeikyWeb.DocumentTypeView, "document_type.json")}
  end

  def render("show.json", %{document_type: document_type}) do
    %{data: render_one(document_type, TestPeikyWeb.DocumentTypeView, "document_type.json")}
  end

  def render("document_type.json", %{document_type: document_type}) do
    %{
      id: document_type.id,
      name: document_type.name,
      operation_add: document_type.operation_add
    }
  end
end
