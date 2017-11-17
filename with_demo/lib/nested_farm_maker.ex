defmodule NestedFarmMaker do
  import AnimalRetriever

  def gather() do
    case get_a_cat() do
      {:ok, cat} ->
        case get_a_dog(cat) do
          {:ok, dog} ->
            case get_a_horse(cat, dog) do
              {:ok, horse} ->
                {cat, dog, horse}
              {:error, msg} ->
                {:error, msg}
            end
          {:error, msg} -> 
            {:error, msg}
        end
      {:error, msg} ->
        {:error, msg}
    end
  end
end
