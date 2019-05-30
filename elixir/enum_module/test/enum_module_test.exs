defmodule EnumModuleTest do
  use ExUnit.Case
  doctest EnumModule

  test "greets the world" do
    assert EnumModule.hello() == :world
  end
end
