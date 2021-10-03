# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :yojee_assignment_sep_29_simple_twitter_app,
  ecto_repos: [YojeeAssignmentSep29SimpleTwitterApp.Repo]

# Configures the endpoint
config :yojee_assignment_sep_29_simple_twitter_app,
       YojeeAssignmentSep29SimpleTwitterAppWeb.Endpoint,
       url: [host: "localhost"],
       secret_key_base: "5j1cemdKwzmoPYrUNLg6kEfedshwLmJXjq0SD2JLP8wj5XHXixqSnAHzZjUoLluc",
       render_errors: [
         view: YojeeAssignmentSep29SimpleTwitterAppWeb.ErrorView,
         accepts: ~w(html json),
         layout: false
       ],
       pubsub_server: YojeeAssignmentSep29SimpleTwitterApp.PubSub,
       live_view: [signing_salt: "GWqb3ahs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :scrivener_html, routes_helper: YojeeAssignmentSep29SimpleTwitterAppWeb.Router.Helpers

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
