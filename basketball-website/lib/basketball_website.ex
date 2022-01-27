defmodule BW do
@moduledoc """
Basketball Website -> Functions for extracting data from a series of nested maps
"""

@type map_data :: map
@type string_path :: String.t()

  defp recursion([],accumulator), do: accumulator

  defp recursion(_,nil), do: nil

  defp recursion([head|tail],accumulator) when is_map(accumulator)  do
    recursion(tail,accumulator[head])
  end



@doc """
First argument is a map with the team features\n
Second argument is a string with the keys that want to be extracted

  data = %{
    "team_mascot" => %{
      "animal" => "bear",
      "actor" => %{
        "first_name" => "Noel"
      }
    },
    "fundacion" => 1930
  }
BW.extract_from_path(data, "team_mascot.actor.first_name")
# => "Noel"

BW.extract_from_path(data, "fundacion")
# => 1930
"""
@spec extract_from_path(map_data,string_path) :: any() | :nil
  def extract_from_path(data, path) do
    [head|tail] =  String.split(path,".")
    recursion(tail,data[head])
  end

@doc """
Same function as extract_from_path implemented more easily
"""
@spec get_in_path(map_data,string_path) :: any() | :nil
  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
