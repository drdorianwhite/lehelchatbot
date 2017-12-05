defmodule Lehelchatbot.Auth do
    import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  
    alias Lehelchatbot.User
    alias Lehelchatbot.Repo

  
    def authenticate(username, given_pass) do
      user = Repo.get_by(User, username: username)
  
      cond  do
        user && checkpw(given_pass, user.password_hash) ->
            { :ok, jwt, _ } = Guardian.encode_and_sign(user, :token)
            {:ok, jwt, user}
        user ->
          {:error, :unauthorized}
        true ->
          dummy_checkpw()
          {:error, :not_found}
      end
    end
  
  end