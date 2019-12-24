# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :real_world,
  ecto_repos: [RealWorld.Repo]

# Configures the endpoint
config :real_world, RealWorldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ewko5wRT2Eeaq7Jw06YHigZdiqW5mAUfBu0p0j5pCyB8DC/e3Qjw/3hMYhfCqX1o",
  render_errors: [view: RealWorldWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RealWorld.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
