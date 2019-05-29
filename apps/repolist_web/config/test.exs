use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :repolist_web, RepolistWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :repolist_web, RepolistWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "repolist_web_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configures mock for a module
config :repolist_web, source: GitHubFetcherBehaviourMock