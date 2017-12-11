defmodule Lehelchatbot.Endpoint do
  use Phoenix.Endpoint, otp_app: :lehelchatbot

  socket "/socket", Lehelchatbot.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :lehelchatbot, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  if Application.get_env(:lehelchatbot, :sql_sandbox) do
    plug Phoenix.Ecto.SQL.Sandbox
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Corsica, origins: ["http://localhost:4000", "https://localhost:4443"]

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_lehelchatbot_key",
    signing_salt: "buV3S3vt"

  plug Lehelchatbot.Router
end
