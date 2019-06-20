defmodule TestPeikyWeb.Router do
  use TestPeikyWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", TestPeikyWeb do
    pipe_through(:api)
    resources("/document_types", DocumentTypeController, only: [:index, :show, :delete, :update])
  end
end
