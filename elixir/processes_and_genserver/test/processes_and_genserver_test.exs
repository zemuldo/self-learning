defmodule ProcessesAndGenserverTest do
  use ExUnit.Case
  doctest ProcessesAndGenserver

  test "greets the world" do
    assert ProcessesAndGenserver.hello() == :world
  end
end
