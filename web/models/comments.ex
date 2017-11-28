defmodule Lehelchatbot.Comments do
    use Ecto.Model
  
    schema "comments"  do
      field :comment_id, :integer
      field :username, :string
      field :message, :string
      timestamps
    end
end

