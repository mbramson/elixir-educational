defmodule ProcessState do
  def loop(state \\ %{}) do
    receive do
      {sender_pid, :get_state} ->
        send(sender_pid, {:ok, state})

      {sender_pid, :get_state_value, key} ->
        send(sender_pid, {:ok, state[key]})

      {:set_state, new_state} ->
        loop(new_state)

      {:set_state_value, key, value} ->
        state
        |> Map.put(key, value)
        |> loop

      _ ->
        IO.puts "what even is this"
    end

    loop(state)
  end
end



