defmodule LearnElixirTest do
  use ExUnit.Case
  doctest LearnElixir

  test "greets the world" do
    assert LearnElixir.hello() == :world
  end
end
