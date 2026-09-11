defmodule ForgeChat.Repo do
  use Ecto.Repo,
    otp_app: :forgechat,
    adapter: Ecto.Adapters.Postgres
end
