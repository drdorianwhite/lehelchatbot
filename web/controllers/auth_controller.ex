defmodule Lehelchatbot.AuthController do
    use Lehelchatbot.Web, :controller
    import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
    
    alias Lehelchatbot.User

    plug :scrub_params, "session" when action in ~w(create)a


    def create(conn, %{"session" => session_params}) do

        case Lehelchatbot.Auth.authenticate(session_params) do
            {:ok, user} ->
                {:ok, jwt, _full_claims} = user |> Guardian.encode_and_sign(:token)
            
                conn
                |> put_status(:created)
                |> render("show.json", jwt: jwt, user: user)

            :error ->
                conn
                |> put_status(:unprocessable_entity)
                |> render("error.json")    
        end
    end

    
    
    def delete(conn, _) do
        {:ok, claims} = Guardian.Plug.claims(conn)
    
        conn
        |> Guardian.Plug.current_token
        |> Guardian.revoke!(claims)
    
        conn
        |> render("delete.json")
    end
    
    def unauthenticated(conn, _params) do
        conn
        |> put_status(:forbidden)
        |> render("forbidden.json", error: "Not Authenticated")
    end


  end



