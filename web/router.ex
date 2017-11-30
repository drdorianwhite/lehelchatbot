defmodule Lehelchatbot.Router do
  use Lehelchatbot.Web, :router

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

  scope "/api/v1", Lehelchatbot do
    pipe_through :api

    get "/comments", CommentController, :index
    get "/comments/:id", CommentController, :show
  end

  scope "/", Lehelchatbot do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Lehelchatbot do
  #   pipe_through :api
  # end
end
