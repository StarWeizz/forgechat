defmodule ForgeChat.RoomServer do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def join(room, pid) do
    GenServer.cast(room, {:join, pid})
  end

  def broadcast(room, text) do
    GenServer.cast(room, {:message, text})
  end

  def members(room) do
    GenServer.call(room, :members)
  end

  @impl true
  def init(_args) do
    {:ok, []}
  end

  @impl true
  def handle_cast({:join, pid}, members) do
    members = [pid | members]
    {:noreply, members}
  end

  @impl true
  def handle_cast({:message, text}, members) do
    Enum.each(members, fn pid -> send(pid, {:new_message, text}) end)
    {:noreply, members}
  end

  @impl true
  def handle_call(:members, _from, members) do
    {:reply, members, members}
  end
end
