defmodule Lehelchatbot.User do
  use Lehelchatbot.Web, :model
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @required_fields ~w(username password)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
    |> validate_length(:password, min: 5)
  end

  def create(changeset, repo) do
    changeset
    |> put_change(:password_hash, hash_password(changeset.params["password"]))
    |> repo.insert()
  end

  defp hash_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
