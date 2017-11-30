# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :lehelchatbot, Lehelchatbot.Endpoint,
http: [port: 4001],
debug_errors: true,
code_reloader: true,
check_origin: false,
watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                  cd: Path.expand("../", __DIR__)]]



config :lehelchatbot, Lehelchatbot.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "lehelchatbot",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :lehelchatbot, ecto_repos: [Lehelchatbot.Repo]

config :phoenix, :stacktrace_depth, 20
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
#     import_config "#{Mix.env}.exs"




