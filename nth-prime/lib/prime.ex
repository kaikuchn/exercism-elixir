defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(1), do: 2

  def nth(count) when count > 1 do
    Stream.iterate(3, &(&1 + 2))
    |> Stream.filter(&prime?/1)
    |> Enum.at(count - 2)
  end

  defp prime?(2), do: true

  defp prime?(number) do
    limit = trunc(:math.sqrt(number))
    not Enum.any?(3..limit//2, &(rem(number, &1) == 0))
  end
end
