defmodule Guesser.GuessingGame do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, [name: GuessingGame] ++ opts)
  end

  def generate_number(lowest \\ 0, highest \\ 10) do
    GenServer.cast(GuessingGame, {:generate_number, lowest, highest})
  end

  def guess(guess) do
    GenServer.call(GuessingGame, {:guess, guess})
  end

  # Server Callbacks

  def init(:ok) do
    {:ok, %{number: nil, correct: 0, wrong: 0}}
  end

  def handle_cast({:generate_number, lowest, highest}, state) do
    new_number = Enum.random(lowest..highest)
    {:noreply, Map.put(state, :number, new_number)}
  end

  def handle_call({:guess, guess}, _from, %{number: nil} = state) do
    {:reply, "You already guessed this number, generate a new one!", state}
  end
  def handle_call({:guess, guess}, _from, %{number: number, correct: correct, wrong: wrong} = state) do
    cond do
      number == guess ->
        new_state = state
          |> Map.put(:number, nil)
          |> Map.put(:correct, correct + 1)
        {:reply, "#{guess} was correct!", new_state}
      number > guess ->
        new_state = state
          |> Map.put(:wrong, wrong + 1)
        {:reply, "#{guess} was too low!", new_state}
      number < guess ->
        new_state = state
          |> Map.put(:wrong, wrong + 1)
        {:reply, "#{guess} was too high!", new_state}
    end
  end
end
