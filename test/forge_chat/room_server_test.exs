defmodule ForgeChat.RoomServerTest do
  use ExUnit.Case

  test "un membre reçoit les messages broadcastés via RoomServer" do
    {:ok, room} = ForgeChat.RoomServer.start_link([])

    ForgeChat.RoomServer.join(room, self())

    ForgeChat.RoomServer.broadcast(room, "salut via GenServer")

    assert_receive {:new_message, _text}
  end
end
