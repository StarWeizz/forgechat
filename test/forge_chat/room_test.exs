defmodule ForgeChat.RoomTest do
  use ExUnit.Case

  test "un membre reçoit les messages broadcastés" do
    room = ForgeChat.Room.start()

    send(room, {:join, self()})
    send(room, {:message, "salut la room"})

    assert_receive {:new_message, _text}
  end
end
