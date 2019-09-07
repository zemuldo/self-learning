defmodule PatternMatchingTest do
  use ExUnit.Case
  doctest PatternMatching

  test "greets the world" do
    assert PatternMatching.hello() == :world
  end
end
