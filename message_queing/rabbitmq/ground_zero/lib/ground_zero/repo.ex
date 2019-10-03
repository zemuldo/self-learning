defmodule GroundZero.Repo do
  use Ecto.Repo,
    otp_app: :ground_zero,
    adapter: Ecto.Adapters.Postgres
end
