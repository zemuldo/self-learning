defmodule SimplePhoenixWebAppWeb.Router do
  use SimplePhoenixWebAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SimplePhoenixWebAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/registrations", UserController, only: [:create, :new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", SimplePhoenixWebAppWeb do
  #   pipe_through :api
  # end
end
