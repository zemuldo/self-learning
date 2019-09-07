defmodule ConditionalsAndLoopsTest do
  use ExUnit.Case
  doctest ConditionalsAndLoops

  test "greets the world" do
    assert ConditionalsAndLoops.hello() == :world
  end
end
