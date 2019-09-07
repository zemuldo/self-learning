# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_query_val_with_ecto,
  ecto_repos: [ApiQueryValWithEcto.Repo]

# Configures the endpoint
config :api_query_val_with_ecto, ApiQueryValWithEctoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AWwhRZcXIJaQy88ISAKoX+rAt4c9lZahzmZr8v5PcnTKVG+oMwJDc3b8Tyhv9kSl",
  render_errors: [view: ApiQueryValWithEctoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ApiQueryValWithEcto.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
