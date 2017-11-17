defmodule NaiveFarmMaker do
  import AnimalRetriever

  def gather() do
    {_, cat}   = get_a_cat()
    {_, dog}   = get_a_dog(cat)
    {:ok, horse} = get_a_horse(cat, dog)

    {cat, dog, horse}
  end
end
