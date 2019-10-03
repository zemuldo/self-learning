use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ground_zero, GroundZeroWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ground_zero, GroundZero.Repo,
  username: "postgres",
  password: "postgres",
  database: "ground_zero_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
