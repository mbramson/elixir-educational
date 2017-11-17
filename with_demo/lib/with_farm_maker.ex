defmodule WithFarmMaker do
  import AnimalRetriever

  def gather() do
    with {:ok, cat}   <- get_a_cat(),
         {:ok, dog}   <- get_a_dog(cat),
         {:ok, horse} <- get_a_horse(cat, dog),
      do: {cat, dog, horse}
  end

  def gather_else() do
    with {:ok, cat}   <- get_a_cat(),
         {:ok, dog}   <- get_a_dog(cat),
         {:ok, horse} <- get_a_horse(cat, dog)
      do 
        {cat, dog, horse}
      else
        {:error, :asdasd} ->
          "error thing happened found "
      end
  end
end
