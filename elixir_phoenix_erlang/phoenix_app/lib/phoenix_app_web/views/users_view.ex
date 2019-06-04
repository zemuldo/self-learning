defmodule PhoenixAppWeb.UsersView do
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
