defmodule Secrets do
  @type secret_function :: (integer -> integer)

  @spec secret_add(secret :: integer) :: secret_function
  def secret_add(secret) do
    fn x -> x + secret end
  end

  @spec secret_subtract(secret :: integer) :: secret_function
  def secret_subtract(secret) do
    fn x -> x - secret end
  end

  @spec secret_multiply(secret :: integer) :: secret_function
  def secret_multiply(secret) do
    fn x -> x * secret end
  end

  @spec secret_divide(secret :: pos_integer | neg_integer) :: secret_function
  def secret_divide(secret) do
    fn x -> Integer.floor_div(x, secret) end
  end

  @spec secret_and(secret :: integer) :: secret_function
  def secret_and(secret) do
    fn x -> x |> Bitwise.band(secret) end
  end

  @spec secret_xor(secret :: integer) :: secret_function
  def secret_xor(secret) do
    fn x -> x |> Bitwise.bxor(secret) end
  end

  @spec secret_combine(secret_function, secret_function) :: secret_function
  def secret_combine(secret_function1, secret_function2) do
    fn x -> x |> secret_function1.() |> secret_function2.() end
  end
end
