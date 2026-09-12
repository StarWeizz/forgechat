defmodule ForgeChatWeb.UserController do
  use ForgeChatWeb, :controller

  alias ForgeChat.Accounts

  def create(conn, params) do
    case Accounts.create_user(params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> json(%{id: user.id, email: user.email, username: user.username})

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} -> msg end)})
    end
  end
end
