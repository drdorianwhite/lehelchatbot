defmodule Lehelchatbot.Router do
    use Lehelchatbot.Web, :router

    pipeline :api do
        plug :accepts, ["json"]
    end

    scope "/api/v1", Lehelchatbot do
        pipe_through :api

        get "/comments", CommentController, :index
        get "/comments/:id", CommentController, :show
    end

end