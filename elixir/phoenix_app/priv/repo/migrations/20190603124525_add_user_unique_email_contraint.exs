defmodule PhoenixApp.Repo.Migrations.AddUserUniqueEmailContraint do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:email])
  end
end
