defmodule RepoFetcher.Repos.GitHub.Fetcher do
  @moduledoc """
  Data fetcher module which requests repositories from GitHub API.
  """
  alias HTTPoison.Response
  alias RepoFetcher.HTTPClient
  alias RepoFetcher.Repos.GitHub.Models.{Repository}
  alias RepoFetcher.Repos.GitHub.Config

  @behaviour RepoFetcher.Repos.GitHub.FetcherBehaviour

  @doc """
  Search for repositories based on languages passed in `query_params`.

  Returns `%{:ok, repositories}` or {:error, message}.

  ## Examples

      iex> RepoFetcher.Repos.GitHub.Fetcher.search(["elixir", "erlang"])
      %{:ok, repositories}

  """
  def search(query_params) do
    lang_query_string = query_params 
      |> Enum.map(&("+language:" <> &1 )) 
      |> Enum.join
    
    {:ok, response} = HTTPClient.get("#{Config.root_endpoint!}/search/repositories?q=" <> lang_query_string, [], params: %{})
    case response do
      %Response{status_code: 200, body: body} ->
        {:ok, map_response(body)}

      %Response{status_code: _, body: body} ->
        {:error, create_error_message(body)}
    end
  end

  defp map_response(%{:items => items}) do
    items |> Enum.map(&Repository.new/1)
  end

  defp create_error_message(_body) do
    "An error ocurred"
  end
 
end
