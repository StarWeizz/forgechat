defmodule ForgeChat.Repo.Migrations.AddNotNullToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      modify :email, :string, null: false
      modify :username, :string, null: false
    end
  end
end
