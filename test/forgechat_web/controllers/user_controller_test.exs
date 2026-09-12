defmodule ForgeChatWeb.UserControllerTest do
  use ForgeChatWeb.ConnCase

  alias ForgeChat.Accounts

  test "POST /api/users renvoie status ok" do
    conn = post(build_conn(), "/api/users", %{email: "antonin@test.com", username: "antonin"})

    response = json_response(conn, 201)
    assert response["username"] == "antonin"
    assert response["email"] == "antonin@test.com"
    assert is_integer(response["id"])
  end

  test "POST /api/users avec un email déjà pris renvoie 422" do
    Accounts.create_user(%{email: "dejapris@test.com", username: "quelquun"})

    conn = post(build_conn(), "/api/users", %{email: "dejapris@test.com", username: "antonin"})

    response = json_response(conn, 422)
    assert response["errors"] == %{"email" => ["has already been taken"]}
  end
end
