defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 20
  end

  test "should shuffle" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
    refute deck == Cards.shuffle(deck)
  end
end
