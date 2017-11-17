defmodule Counter do
  @moduledoc"""
  Module for counting things
  """

  @doc """
  Returns the number of items in the list
  """
  def count(list) when is_list(list) do
    count(list, 0)
  end

  def count([], count) do
    count
  end
  def count([_item | rest_of_list], count) do
    count(rest_of_list, count + 1)
  end
end
