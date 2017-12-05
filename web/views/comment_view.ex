defmodule Lehelchatbot.CommentView do
    use Lehelchatbot.Web, :view

        def render("show.json", comment) do
          %{
            username: comment.username,
            message: comment.message,
            inserted_at: comment.inserted_at
          }
        end
      
        def render("error.json", _) do
          %{message: "invalid parameters given to create comment"}
        end
end