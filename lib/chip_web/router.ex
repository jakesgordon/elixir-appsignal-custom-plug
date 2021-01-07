defmodule ChipWeb.Router do
  use ChipWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ChipWeb do
    pipe_through :browser
    get "/",    PageController, :index
    get "/foo", PageController, :foo
    get "/bar", PageController, :bar
    get "/custom", PageController, :custom
  end

end
