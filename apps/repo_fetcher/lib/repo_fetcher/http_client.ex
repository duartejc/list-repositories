defmodule RepoFetcher.HTTPClient do
  @moduledoc """
  Poison HTTP Client for RepoFetcher
  """

  use HTTPoison.Base

  @doc """
  Complete / Filter URL

  ### Examples

      iex> Application.put_env(:repo_fetcher_github, :api_version, "v3")
      iex> Application.delete_env(:repo_fetcher_github, :api_version)
      iex> RepoFetcher.HTTPClient.process_url("test")
      "https://api.github.com"

      iex> Application.put_env(:repo_fetcher_github, :api_version, "v3")
      iex> Application.delete_env(:repo_fetcher_github, :api_version)
      iex> RepoFetcher.HTTPClient.process_url("https://api.github.com")
      "https://api.github.com"

  """
  
  # Make it easier to mock Responses
  case Mix.env do
    :test ->
      def process_response_body(body) do
        body
        |> _process_response_body
        |> RepolistPhoenix.MockServer.dump
      end
    _ ->
      def process_response_body(body), do:  _process_response_body(body)
  end

  defp _process_response_body(body), do: Poison.decode!(body, keys: :atoms)

end
