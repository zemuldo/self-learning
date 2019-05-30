defmodule OperatorsTest do
  use ExUnit.Case
  doctest Operators

  test "greets the world" do
    assert Operators.hello() == :world
  end
end
