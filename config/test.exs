use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :lehelchatbot, Lehelchatbot.Endpoint,
  http: [port: 4001],
  server: false

config :lehelchatbot, sql_sandbox: true

# Print only warnings and errors during test
config :logger, level: :warn

