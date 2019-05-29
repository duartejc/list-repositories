defmodule RepolistWeb.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories) do
      add :name, :string
      add :full_name, :string
      add :description, :string, size: 600
      add :private, :boolean, default: false, null: false
      add :html_url, :string
      add :homepage, :string
      add :language, :string
      add :forks_count, :integer
      add :stargazers_count, :integer
      add :topics, {:array, :string}
      add :watchers_count, :integer
      add :open_issues_count, :integer
      add :pushed_at, :naive_datetime
      add :created_at, :naive_datetime
      add :updated_at, :naive_datetime
      add :license, :map
      add :owner, :map

      timestamps([{:updated_at, :_updated_at}])
    end

  end
end
