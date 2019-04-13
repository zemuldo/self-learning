defmodule Identicon do
  def main(input) do
    input
    |> hash_input
  end

  def pick_color(%Identicon.Image{hex: [ r, g, b | _tail ]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    %Identicon.Image{hex: :crypto.hash(:md5, input) |> :binary.bin_to_list}
  end
end
