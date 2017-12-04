defmodule Lehelchatbot.Auth do
    import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  
    alias Lehelchatbot.User
    alias Lehelchatbot.Repo

  
    def authenticate(%{"username" => username, "password" => given_pass})) do
      user = Repo.get_by(User, username: username)
  
      case  do
        user && checkpw(given_pass, user.password_hash) ->
          {:ok, user}
        user ->
          {:error, :unauthorized}
        true ->
          dummy_checkpw
          {:error, :not_found}
      end
    end
  
  end