# PhoenixApp
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

#### Create signup controller at `lib/phoenix_app_web/controllers/users_controller.ex`

```elixir
    defmodule PhoenixAppWeb.AccounstController do
        use PhoenixAppWeb, :controller
        alias PhoenixApp.Accounts
        alias PhoenixAppWeb.AccounstView

        def index(conn, params) do
            case Accounts.create_user(params) do
            {:ok, _} ->
                conn
                |> render("success.json", message: "ok")

            {:error, changeset} ->
                conn
                |> put_status(400)
                |> render("error.json", changeset: changeset)
            end
        end
    end
```

#### Create signup view at `lib/phoenix_app_web/controllers/users_controller.ex`

```elixir
    defmodule PhoenixAppWeb.AccounstView do
        use PhoenixAppWeb, :view
        alias PhoenixAppWeb.ErrorHelpers

        def render("success.json", %{message: message}) do
            %{status: "ok", code: 200, errors: []}
        end

        def render("error.json",  %{changeset: changeset}) do
            # When encoded, the changeset returns its errors
            # as a JSON object. So we just pass it forward.
            %{status: "error", errors: translate_changeset_errors(changeset), code: 400}
        end
    end
```
#### Add changeset helper for converting ecto change sets at `lib/phoenix_app_web/views/error_helpers.ex`

```elixir
    def translate_changeset_errors(changeset) do
       Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
    end
```

#### Add the register route 
```elixir
 scope "/", PhoenixAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/register", AccounstController, :index
  end
```

#### Password policy
