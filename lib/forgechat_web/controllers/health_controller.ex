defmodule ForgeChatWeb.HealthController do
  use ForgeChatWeb, :controller

  def index(conn, _params) do
    json(conn, %{status: "ok"})
  end
end
