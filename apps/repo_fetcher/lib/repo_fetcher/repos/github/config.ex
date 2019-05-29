defmodule RepoFetcher.Repos.GitHub.Config do
  @moduledoc """
  GitHub API Config Module
  """

  @default_api_version "v3"

  @doc """
  Return configured API Version

  ### Examples

      iex> Application.put_env(:repo_fetcher_github, :api_version, "1.0")
      iex> RepoFetcher.Repos.GitHub.Config.api_version()
      "1.0"

      iex> Application.delete_env(:repo_fetcher_github, :api_version)
      iex> RepoFetcher.Repos.GitHub.Config.api_version()
      "3.0"

  """
  @spec api_version() :: String.t
  def api_version, do: Application.get_env(:repo_fetcher_github, :api_version, @default_api_version)

  @doc """
  Return configured API Version

  ### Examples

      iex> RepoFetcher.Repos.GitHub.Config.root_endpoint!()
      "https://api.github.com"

  """
  @spec root_endpoint!() :: String.t | no_return
  def root_endpoint! do
    "https://api.github.com"
  end
end