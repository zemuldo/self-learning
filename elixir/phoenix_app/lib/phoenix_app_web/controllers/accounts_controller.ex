defmodule PhoenixAppWeb.AccountsController do
  use PhoenixAppWeb, :controller
  alias PhoenixApp.Accounts
  alias PhoenixAppWeb.AccounstView

  alias PhoenixApp.{Accounts}
  alias PhoenixAppWeb.ErrorHelpers

  def index(conn, params) do
    case Accounts.create_user(params) do
      {:ok, _} ->
        conn
        |> render("success.json", message: "ok")

      {:error, changeset} ->
        conn
        |> put_status(400)
        |> render("error.json", errors: ErrorHelpers.translate_changeset_errors(changeset))
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    Accounts.authenticate_user(email, password)
    |> login_reply(conn)
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> render("user.json", user: user)
  end

  defp login_reply({:error, reason}, conn) do
    conn
     |> render("error.json", errors: %{login_failed: ["invalid credentials"]})
  end
end
