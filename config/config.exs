# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :lehelchatbot, Lehelchatbot.Endpoint,
http: [port: 4000],
https: [port: 4443,
        otp_app: :lehelchatbot,
        keyfile: "priv/keys/localhost.key",
        certfile: "priv/keys/localhost.cert"],
debug_errors: true,
code_reloader: false,
check_origin: false,
secret_key_base: "SuPerseCret_aBraCadabrASuPerseCret_aBraCadabrASuPerseCret_aBraCadabrASuPerseCret_aBraCadabrA",
watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                  cd: Path.expand("../", __DIR__)]]



config :lehelchatbot, Lehelchatbot.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "lehelchatbot",
  username: "postgres",
  password: "postgres",
  hostname: "postgres",
  port: "5439"

  config :lehelchatbot, Guardian,
  allowed_algos: ["HS512", "HS384"],
  issuer: "Lehelchatbot",
  ttl: {30, :days},
  verify_issuer: true,
  module: Lehelchatbot.Guardian,
  secret_key:  "SuPerseCret_aBraCadabrA"

config :lehelchatbot, ecto_repos: [Lehelchatbot.Repo]

config :phoenix, :stacktrace_depth, 20

config :lehelchatbot, dialogflow: [
  username: "chatbot",
  password: "insecure123",
  realm: "dialogflow webhook"
]

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :lehelchatbot, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:lehelchatbot, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
import_config "#{Mix.env}.exs"




