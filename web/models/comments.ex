defmodule Lehelchatbot.Comments do
    use Lehelchatbot.Web, :model
  
    schema "comments"  do
      field :username, :string
      field :message, :string
      timestamps()
    end
end

