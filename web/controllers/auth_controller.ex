defmodule Lehelchatbot.AuthController do
    use Lehelchatbot.Web, :controller

    alias Lehelchatbot.Guardian
    

    plug :scrub_params, "session" when action in ~w(create)a


    def create_authtoken(conn, %{"session" => session_params}) do

        case Lehelchatbot.Auth.authenticate(session_params.usernmae, session_params.password) do
            {:ok, jwt, user} ->
                conn
                |> put_status(:created)
                |> render("show.json", jwt: jwt, user: user)

            {:error, _} ->
                conn
                |> put_status(:unprocessable_entity)
                |> render("error.json")    
        end
    end

    
    
    def delete_authtoken(conn, _) do
        conn
        |> Guardian.Plug.current_token
        |> Guardian.revoke
        |> render("delete.json")
    end
    
    def unauthenticated(conn, _params) do
        conn
        |> put_status(:forbidden)
        |> render("forbidden.json", error: "Not Authenticated")
    end


  end



