defmodule ForgeChat.Echo do
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:hello, name} ->
        IO.puts("Salut, #{name} !")
        loop()
    end
  end
end
