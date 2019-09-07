defmodule ApiQueryValWithEcto.Repo do
  use Ecto.Repo,
    otp_app: :api_query_val_with_ecto,
    adapter: Ecto.Adapters.Postgres
end
