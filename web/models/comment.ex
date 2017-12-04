defmodule Lehelchatbot.Comment do
  use Lehelchatbot.Web, :model

  schema "comments" do
    field :message, :string
    belongs_to :user, Lehelchatbot.User, foreign_key: :user_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:message])
    |> validate_required([:message])
    |> assoc_constraint(:user)
  end
end
