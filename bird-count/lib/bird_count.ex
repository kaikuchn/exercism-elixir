defmodule BirdCount do
  @spec today(list) :: integer
  def today([]), do: nil
  def today([bird_count_today | _]), do: bird_count_today

  @spec increment_day_count(list) :: list
  def increment_day_count([]), do: [1]
  def increment_day_count([bird_count_today | other_days]), do: [bird_count_today + 1 | other_days]

  @spec has_day_without_birds?(list) :: bool
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)

  @spec total(list) :: integer
  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  @spec busy_days(list) :: integer
  def busy_days([]), do: 0
  def busy_days([bird_count | tail]) when bird_count < 5, do: busy_days(tail)
  def busy_days([_bird_count | tail]), do: 1 + busy_days(tail)
end
