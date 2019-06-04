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
