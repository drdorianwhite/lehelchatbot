defmodule Lehelchatbot.UserController do
    use Lehelchatbot.Web, :controller
  
    alias Lehelchatbot.User

    plug :scrub_params, "user" when action in [:create]
  
    def show(conn, %{"id" => id}) do
      user = Repo.get!(User, id)
      render(conn, "show.html", user: user)
    end
  
    def new(conn, _params) do
      changeset = User.changeset(%User{})
      render conn, "new.html", changeset: changeset
    end

  
    def create(conn, %{"user" => user_params}) do
        changeset = User.changeset(%User{}, user_params)

        case User.create(changeset, Lehelchatbot.Repo) do
            {:ok, user} ->
                conn    
                |> Lehelchatbat.Auth.login(user)
                |> put_flash(:info, "#{user.username} created!")
                |> redirect(to: user_path(conn, :show, user))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
         end
    end

    def login(conn, username, given_pass) do
        user = Repo.get_by(User, username: username)
    
        cond do
          user && checkpw(given_pass, user.password_hash) ->
            {:ok, login(conn, user)}
          user ->
            {:error, :unauthorized, conn}
          true ->
            dummy_checkpw
            {:error, :not_found, conn}
        end
      end
  end