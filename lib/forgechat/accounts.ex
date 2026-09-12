defmodule ForgeChat.Accounts do
  alias ForgeChat.Repo
  alias ForgeChat.Accounts.User

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
