#Journey
## Initial Setup
Created app using `mix phx.new phoenix_app`

Installed dependencies with `mix deps.get`

Created db and tables using `mix ecto.create`

Run initial migrations using `mix ecto.migrate`

Run the app using `mix phx.server`

Create Accounts context and Users model`mix phx.gen.context Accounts User users first_name:string last_name:string is_active:boolean email:string password:string`

Run migrations again `mix ecto.migrate`

### Encrypt Passwords
lib/phoenix_app/accounts/user.ex
```elixir

    alias Bcrypt

    def changeset(%User{} = user, attrs) do
        user
        |> cast(attrs, [:username, :password])
        |> validate_required([:username, :password])
        |> put_password_hash()
    end

    defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
    end

    defp put_password_hash(changeset), do: changeset
```
Create new account 
```
PhoenixApp.Accounts.create_user(%{first_name: "Danstan", last_name: "Onyango", email: "danstan@zemuldo.com", password: "omera"})
```

## Unique emails
Add ```|> unique_constraint(:email)``` to the last pipe for the users repo changeset.
Generate new migration file `mix ecto.gen.migration add_user_unique_email_contraint`
Inside the generated migration file, 
```elixir
    defmodule PhoenixApp.Repo.Migrations.AddUserUniqueEmailContraint do
        use Ecto.Migration

        def change do
            create unique_index(:users, [:email])
        end
    end
```
Migrate again ```mix ecto.mirate```
### TIP
- You can undo these migrations using ```mix ecto.rollnback```
- If you run migrations with duplicate emails in DB already you will get an error.

## Sigup Endpoint
