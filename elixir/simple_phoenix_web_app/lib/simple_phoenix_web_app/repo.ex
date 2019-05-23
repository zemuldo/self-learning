defmodule SimplePhoenixWebApp.Repo do
  use Ecto.Repo,
    otp_app: :simple_phoenix_web_app,
    adapter: Ecto.Adapters.Postgres
end
