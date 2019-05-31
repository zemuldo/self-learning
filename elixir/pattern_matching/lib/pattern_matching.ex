defmodule PatternMatching do
  @moduledoc """
  Documentation for PatternMatching.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PatternMatching.hello()
      :world

  """
  def hello do
    :world
  end

  def reduce_list([], reduced) do reduced end

  def reduce_list([first | rest ], reduced) do
    reduce_list(rest, Map.put(reduced, first, "Done"))
  end

end
