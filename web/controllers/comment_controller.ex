defmodule Lehelchatbot.CommentController do
    use Lehelchatbot.Web, :controller
  
    def index(conn, _params) do
      users = Repo.all(Lehelchatbot.Comments)
  
      json conn, users
    end

    def show(conn, %{"id" => id}) do
        
    end
     
end