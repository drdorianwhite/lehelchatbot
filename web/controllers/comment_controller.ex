defmodule Lehelchatbot.CommentController do
    use Lehelchatbot.Web, :controller
  
    def index(conn, _params) do
      users = Repo.all(Lehelchatbot.Comment)
  
      json conn, users
    end

    def show(conn, %{"id" => id}) do
        
    end

    def create(conn, _params) do
      changeset = Lehelchatbot.Comment.changeset(%Lehelchatbot.Comment{}, _params)
      
          case Repo.insert(changeset) do
            {:ok, comment} ->
              json conn |> put_status(:created), comment
            {:error, changeset} ->
              json conn |> put_status(:unprocessable_entity), changeset
          end
    end
     
end