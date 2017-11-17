defmodule AnimalRetriever do
  def get_a_cat() do
    if :rand.uniform() < 0.9 do
      {:ok, :cat}
    else
      {:error, :could_not_find_cat}
    end
  end

  def get_a_dog(:cat) do
    if :rand.uniform() < 0.9 do
      {:ok, :dog}
    else
      {:error, :could_not_find_dog}
    end
  end
  def get_a_dog(_), do: raise "need a cat to get a dog"

  def get_a_horse(:cat, :dog) do
    if :rand.uniform() < 0.9 do
      {:ok, :horse}
    else
      {:error, :could_not_find_horse}
    end
  end
  def get_a_horse(_, _), do: raise "need a cat and a dog to get a horse"
end
