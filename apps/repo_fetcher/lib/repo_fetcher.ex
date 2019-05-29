defmodule RepoFetcher.Repos.GitHub.FetcherBehaviour do
  @moduledoc """
  Callback definition.
  """
  @callback search(List.t()) :: tuple()
end
