defmodule Lehelchatbot.AuthView do
    use Lehelchatbot.Web, :view

        def render("show.json", %{jwt: jwt, user: user}) do
          %{
            jwt: jwt,
            user: user
          }
        end
      
        def render("error.json", _) do
          %{message: "Invalid email or password"}
        end
      
        def render("delete.json", _) do
          %{ok: true}
        end
      
        def render("forbidden.json", %{error: error}) do
          %{message: error}
        end

end