defmodule PhoenixAppWeb.ErrorView do
  use PhoenixAppWeb, :view

  def render("400.json", _assigns) do
    %{code: 400, error: "bad request"}
  end
end
