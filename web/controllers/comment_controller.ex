defmodule Lehelchatbot.CommentController do
    use Lehelchatbot.Web, :controller

    plug BasicAuth, [use_config: {:lehelchatbot , :dialogflow}] when action in [:create_from_dialogflow]
  
    def index(conn, _params) do
      users = Repo.all(Lehelchatbot.Comment)
  
      json conn, users
    end

    def show(conn, %{"id" => id}) do
        comment = Repo.get_by(Lehelchatbot.Comment, id: id)

        conn
        |> put_status(:ok)
        |> render("show.json", comment: comment)
    end

    def create(conn, params) do
      changeset = Lehelchatbot.Comment.changeset(%Lehelchatbot.Comment{}, params)
      
          case Repo.insert(changeset) do
            {:ok, comment} ->
              json conn |> put_status(:created), comment
            {:error, changeset} ->
              json conn |> put_status(:unprocessable_entity), changeset
          end
    end

    def create_from_dialogflow(conn, _params) do
      
      if  conn.body_params && conn.body_params.displayText do
          botUser = Lehelchatbot.UserController.get_by_username("chatbot")
          create(conn,  %Lehelchatbot.Comment{user_id: botUser.id, message: conn.body_params.displayText})
      else
          render('error.json', %{})
      end
    end
     
end