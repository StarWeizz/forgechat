defmodule ForgeChatTest do
  use ExUnit.Case
  doctest ForgeChat

  test "greets the world" do
    assert ForgeChat.hello() == :world
  end
end
