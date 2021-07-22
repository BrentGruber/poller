# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :poller,
  ecto_repos: [Poller.Repo]

# Configures the endpoint
config :poller, PollerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mNzWDwr71hLKR01hXuvee4NdUNP4TAvFNx3+TjLzIcjesP3AL3L9hjBDs1GTUn6N",
  render_errors: [view: PollerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Poller.PubSub,
  live_view: [signing_salt: "k3FBHi38"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
