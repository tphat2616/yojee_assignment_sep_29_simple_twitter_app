use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :yojee_assignment_sep_29_simple_twitter_app, YojeeAssignmentSep29SimpleTwitterApp.Repo,
  username: "postgres",
  password: "123456",
  database:
    "yojee_assignment_sep_29_simple_twitter_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :yojee_assignment_sep_29_simple_twitter_app,
       YojeeAssignmentSep29SimpleTwitterAppWeb.Endpoint,
       http: [port: 4002],
       server: false

# Print only warnings and errors during test
config :logger, level: :warn
