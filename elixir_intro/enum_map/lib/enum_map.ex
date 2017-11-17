defmodule EnumMap do
  @moduledoc """
  Implementation of Enum.map
  """

  @doc """
  Applies the given function to each element of a list and returns
  the resulting list
  """
  def do_map([], _), do: []
  def do_map([head_of_list | rest_of_list], function) do
    [ function.(head_of_list) | do_map(rest_of_list, function) ]
  end
end
