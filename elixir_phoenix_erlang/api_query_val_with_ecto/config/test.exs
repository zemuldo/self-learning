use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_query_val_with_ecto, ApiQueryValWithEctoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :api_query_val_with_ecto, ApiQueryValWithEcto.Repo,
  username: "postgres",
  password: "postgres",
  database: "api_query_val_with_ecto_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
