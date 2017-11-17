defmodule ProcessStateGenServer do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_state(pid) do
    GenServer.call(pid, :get_state)
  end

  def set_state(pid, new_state) do
    GenServer.cast(pid, {:set_state, new_state})
  end

  # Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call(:get_state, _from_pid, state) do
    {:reply, state, state}
  end

  def handle_cast({:set_state, new_state}, state) do
    {:noreply, new_state}
  end

  def handle_info(msg, state) do
    IO.puts "ProcessStateGenServer received #{msg}"
  end
end


