defmodule PhoenixAppWeb.AccountsView do
  use PhoenixAppWeb, :view
  alias PhoenixAppWeb.ErrorHelpers

  def render("success.json", %{message: message}) do
    %{status: "ok", code: 200, errors: []}
  end

  def render("user.json", %{user: user}) do
    %{
      status: "ok",
      code: 200,
      errors: [],
      user: %{
        id: user.id,
        first_name: user.first_name,
        lats_name: user.last_name,
        email: user.email
      }
    }
  end

  def render("error.json", %{errors: errors}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{status: "error", errors: errors, code: 400}
  end
end
