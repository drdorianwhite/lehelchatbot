defmodule Lehelchatbot.Router do
  use Lehelchatbot.Web, :router


  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated, handler: Lehelchatbot.AuthController
    plug Guardian.Plug.LoadResource
  end


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

    post "/session/", SessionController, :create

    post "/users/", UserController, :create

    get "/comments", CommentController, :index
    get "/comments/:id", CommentController, :show

    post "/comments/dialogflow", CommentController, :response

    

    pipe_through :api_auth

    post "/comments", CommentController, :create

    delete "/session/", SessionController, :delete

    get "/current_user/", CurrentUserController, :show
  end

  scope "/site", Lehelchatbot do
    pipe_through [:browser]
    
    get "/", PageController, :index
    get "/*path", PageController, :index
  end

  scope "/", Lehelchatbot do
    pipe_through [:browser]

    get "/", RedirectController, :redirector
  end

end

defmodule Lehelchatbot.RedirectController do
  use Lehelchatbot.Web, :controller
  @send_to "/site"
  
  def redirector(conn, _params), do: redirect(conn, to: @send_to)

end


