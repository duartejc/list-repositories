defmodule RepolistWeb.RepositoriesTest do
  use ExUnit.Case
  use RepolistWeb.ConnCase, async: true

  alias RepolistWeb.Repositories
  alias RepoFetcher.Repos.GitHub.Models.Repository
  alias RepoFetcher.Repos.GitHub.Fetcher, as: GitHubFetcher

  import Mox

  @languages ["elixir", "erlang"]
  @repositories [ %Repository{
    id: "1",
    node_id: "111111111",
    name: "elixir",
    full_name: "elixir-lang/elixir",
    description: "Elixir is a dynamic, functional language designed for building scalable and maintainable applications",
    private: false,
    fork: false,
    url: "https://github.com/elixir-lang/elixir.git",
    html_url: "https://github.com/elixir-lang/elixir",
    homepage: "https://github.com/elixir-lang/elixir",
    language: "elixir",
    forks_count: 2200,
    stargazers_count: 15000,
    watchers_count: 725,
    default_branch: "master",
    master_branch: "master",
    open_issues_count: 10
  }]

  describe "index route: returns repositories" do
    test "search repositories by languages" do
  
      GitHubFetcherBehaviourMock
      |> expect(:search, fn _query_params ->
        {:ok, @repositories}
      end)
  

      conn = get(build_conn(), "api/repositories", %{"languages" => %{"0" => "elixir"}})
  
      assert json_response(conn, 200) == %{
               "data" => @repositories |> Enum.map |> Map.from_struct
             }
    end
  end
end
