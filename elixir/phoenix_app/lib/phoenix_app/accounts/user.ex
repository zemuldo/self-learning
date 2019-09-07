defmodule PhoenixApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bcrypt

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :is_active, :boolean, default: false
    field :last_name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :is_active, :email, :password])
    |> validate_required([:first_name, :last_name, :is_active, :email, :password])
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
