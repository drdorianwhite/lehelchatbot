defmodule Lehelchatbot.UserTest do
  use Lehelchatbot.ModelCase

  alias Lehelchatbot.User

  @valid_attrs %{password_hash: "some password_hash", username: "some username"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
