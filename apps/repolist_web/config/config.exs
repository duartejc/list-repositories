# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :repolist_web,
  ecto_repos: [RepolistWeb.Repo]

# Configures the endpoint
config :repolist_web, RepolistWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R63qEHvsYlNxzBTv8f0RU1sSEXS4dME1vDrzaiK6v6SGV8dBQKcmf8RVe61apgZF",
  render_errors: [view: RepolistWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RepolistWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures mock for a module
config :repolist_web, source: RepoFetcher.Repos.GitHub.Fetcher

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
