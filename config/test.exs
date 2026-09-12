import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :forgechat, ForgeChatWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "s3EF13DHrw4dp9suhUS51yK60nr68lLhyzuj2LJl+Wc9WTQmr9fl5QffEqTTNNdC",
  server: false

config :forgechat, ForgeChat.Repo,
  username: "forgechat",
  password: "forgechat_dev",
  hostname: "localhost",
  database: "forgechat_test",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  pool: Ecto.Adapters.SQL.Sandbox

# In test we don't send emails
config :forgechat, ForgeChat.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Sort query params output of verified routes for robust url comparisons
config :phoenix,
  sort_verified_routes_query_params: true
