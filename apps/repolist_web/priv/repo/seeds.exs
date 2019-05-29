# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RepolistWeb.Repo.insert!(%RepolistWeb.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

defmodule RepolistWeb.DatabaseSeeder do
  alias RepolistWeb.Repo
  alias RepolistWeb.Repository

  def insert_repository(repo_struct) do

    params = Map.from_struct(repo_struct)

    changeset = Repository.changeset(%Repository{}, params)
    Repo.insert!(changeset)
  end

  def clear do
    Repo.delete_all
  end
end

RepoFetcher.Repos.GitHub.Fetcher.repositories!()
  |> Enum.each(&RepolistWeb.DatabaseSeeder.insert_repository(&1))