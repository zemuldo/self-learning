# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :simple_phoenix_web_app,
  ecto_repos: [SimplePhoenixWebApp.Repo]

# Configures the endpoint
config :simple_phoenix_web_app, SimplePhoenixWebAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DmvFOnXxXQHy8B3dmgVeKWIskPVP+sECjnIGevvml3XtiY6B6phK9C8n74GlwjuH",
  render_errors: [view: SimplePhoenixWebAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SimplePhoenixWebApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
