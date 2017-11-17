defmodule Cat do
  @moduledoc """
  Cats are furry and make sounds.
  """

  @other_sound "woof"

  defstruct color: "black", sound: :meow

  @doc """
  Returns :meow
  """
  def make_sound(%Cat{sound: :woof}) do
    :woof
  end
  def make_sound(%Cat{} = cat), do: cat.sound
  def make_sound(_cat), do: make_default_sound()

  defp make_default_sound() do
    @other_sound
  end
end
