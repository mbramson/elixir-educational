defmodule StructDemo do
  defstruct name: "Fred", pets: []

  def make_a_noise(%StructDemo{pets: []}) do
     IO.puts "made all of the noises I could"
  end
  def make_a_noise(%StructDemo{pets: ["cat" | rest_of_pets]}) do
    IO.puts "meow"
    make_a_noise(%StructDemo{pets: rest_of_pets})
  end
  def make_a_noise(%StructDemo{pets: ["dog" | rest_of_pets]}) do
    IO.puts "woof"
    make_a_noise(%StructDemo{pets: rest_of_pets})
  end
  def make_a_noise(%StructDemo{pets: [_pet | rest_of_pets]}) do
    IO.puts "????"
    make_a_noise(%StructDemo{pets: rest_of_pets})
  end
  def make_a_noise(_) do
    IO.puts "don't understand how to make a noise with this"
  end
end
