defmodule Lehelchatbot.CurrentUserController do
    use Lehelchatbot.Web, :controller
    
        def show(conn, _) do
            user = Guardian.Plug.current_resource(conn)
        
            conn
            |> put_status(:ok)
            |> render("show.json", user: user)
            
        end
    
end