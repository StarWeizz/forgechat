defmodule ForgeChat.Room do
  def start do
    spawn(fn -> loop([]) end)
  end

  def loop(members) do
    receive do
      {:join, pid} ->
        members = [pid | members]
        loop(members)

      {:message, text} ->
        Enum.each(members, fn pid -> send(pid, {:new_message, text}) end)
        loop(members)
    end
  end
end
