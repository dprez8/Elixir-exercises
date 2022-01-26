defmodule KC do
  @moduledoc """
  KitchenCalculator -> Functions for converting measure units
  """

  @type measure :: {unit :: any,volume :: number}

  @measures %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

@doc """
Receives a measure and returns its volume\n
KitchenCalculator.get_volume({:cup, 2.0})
# => 2.0
"""
  @spec get_volume(measure) :: number
  def get_volume({_unit, volume}), do: volume

  @spec to_milliliter(measure) :: {:milliliter, number}
  def to_milliliter({unit, volume}), do: {:milliliter, volume * @measures[unit]}

  @spec from_milliliter(measure, atom) :: measure
  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / @measures[unit]}



@doc """
Converts any measure to another unit
KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
# => {:tablespoon, 3.0}
"""
@spec convert(measure, atom) :: measure
def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
