defmodule BW do
@moduledoc """
Basketball Website -> Functions for extracting data from a series of nested maps
"""

@type map_data :: map
@type string_path :: String.t()

  defp recursion([],result), do: result

  defp recursion(_,nil), do: nil

  defp recursion([head|tail],result) when is_map(result)  do
    recursion(tail,result[head])
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
    }
  }
BW.extract_from_path(data, "team_mascot.actor.first_name")
# => "Noel"
"""
@spec extract_from_path(map_data,string_path) :: String.t() | :nil
  def extract_from_path(data, path) do
    [head|tail] = path  |> String.split(".")
    recursion(tail,data[head])
  end

@doc """
Same function as extract_from_path implemented more easily
"""
@spec get_in_path(map_data,string_path) :: String.t() | :nil
  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
