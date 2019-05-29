defmodule RepolistWeb.RepositoryController do
  @moduledoc """
  Repository controller module. Exposes json content.
  """
  use RepolistWeb.Web, :controller

  alias RepolistWeb.Repository
  alias RepoFetcher.Repos.GitHub.Fetcher, as: GitHubFetcher

  @source Application.get_env(:repolist_web, :source)

  @doc """
  List repositories by given `languages`.
  """
  def index(conn,  %{"languages" => languages}) do

    languages = Enum.map(languages, fn {k, v} -> v end)
    
    query = from repository in Repository

    case GitHubFetcher.search(languages) do
      {:ok, repositories} ->
        Repo.delete_all(query)
        repositories |> Enum.map(&save_repo/1)
      {:error, _} ->

    end

    repositories = Repo.all(query)
    render(conn, "index.json", repositories: repositories)
  end

  defp save_repo(repo_struct) do
    params = Map.from_struct(repo_struct)

    changeset = Repository.changeset(%Repository{}, params)
    Repo.insert!(changeset)
  end

end
