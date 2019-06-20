# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :test_peiky,
  ecto_repos: [TestPeiky.Repo]

# Configures the endpoint
config :test_peiky, TestPeikyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4ZBizVT4KIvVNOvxkN1oKFIYqPRgHRGmMGZSRfnq0CBQar+S7YIPpH3umE9f4dyM",
  render_errors: [view: TestPeikyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestPeiky.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
