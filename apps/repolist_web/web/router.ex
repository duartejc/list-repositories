defmodule RepolistWeb.Router do
  @moduledoc """
  Router module
  """
  use RepolistWeb.Web, :router

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

  scope "/api", RepolistWeb do
    pipe_through :browser # Use the default browser stack

    get "/repositories", RepositoryController, :index
  end

  scope "/", RepolistWeb do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

end
