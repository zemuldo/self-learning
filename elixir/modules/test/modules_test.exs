defmodule ModulesTest do
  use ExUnit.Case
  doctest Modules

  test "greets the world" do
    assert Modules.hello() == :world
  end
end
