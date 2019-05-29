defmodule RepolistWeb.RepositoryView do
  use RepolistWeb.Web, :view
  alias RepolistWeb.RepositoryView

  def render("index.json", %{repositories: repositories}) do
    %{data: render_many(repositories, RepositoryView, "repository.json")}
  end

  def render("show.json", %{repository: repository}) do
    %{data: render_one(repository, RepositoryView, "repository.json")}
  end

  def render("repository.json", %{repository: repository}) do
    %{id: repository.id,
      name: repository.name,
      full_name: repository.full_name,
      description: repository.description,
      private: repository.private,
      html_url: repository.html_url,
      homepage: repository.homepage,
      language: repository.language,
      forks_count: repository.forks_count,
      stargazers_count: repository.stargazers_count,
      watchers_count: repository.watchers_count,
      open_issues_count: repository.open_issues_count,
      topics: repository.topics,
      pushed_at: repository.pushed_at,
      created_at: repository.created_at,
      updated_at: repository.updated_at,
      license: repository.license,
      owner: repository.owner}
  end
end
