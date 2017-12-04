defmodule Lehelchatbot.SessionView do
    use Lehelchatbot.Web, :view

        def render("show.json", %{jwt: jwt, user: user}) do
          %{
            jwt: jwt,
            user: user
          }
        end

    end

end