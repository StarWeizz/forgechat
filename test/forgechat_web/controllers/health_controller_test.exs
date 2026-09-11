defmodule ForgeChatWeb.HealthControllerTest do
  use ForgeChatWeb.ConnCase

  test "GET /api/health renvoie status ok" do
    conn = get(build_conn(), "/api/health")
    assert json_response(conn, 200) == %{"status" => "ok"}
  end
end
