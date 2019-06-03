defmodule Cards do
  @moduledoc """
   Provides methods for creating handling a deck of cards
  """

  @doc """
   Returns a list of strings representing a dec of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
   Determines whether a deck contains a given card

  ## Examples
        iex> deck = Cards.create_deck()
        iex> Cards.contains?(deck, "Ace of Spades")
        true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
   Devides a deck into a hand and the remainder of the deck .
   The `hand_size` indicates how many cards should be in the hand

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, _deck } = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
    File.write!(filename, binary)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, content} -> :erlang.binary_to_term content
      {:error, _reason} -> "File Does not Exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
