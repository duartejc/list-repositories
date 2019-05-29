defmodule RepolistWeb.Repository do
  @moduledoc """
  Repository model module
  """
  use RepolistWeb.Web, :model
  import Ecto.Changeset
  alias RepolistWeb.{Repository, User}

  schema "repositories" do
    field :created_at, :naive_datetime
    field :description, :string
    field :forks_count, :integer
    field :full_name, :string
    field :homepage, :string
    field :html_url, :string
    field :language, :string
    field :license, :map
    field :name, :string
    field :open_issues_count, :integer
    field :private, :boolean, default: false
    field :pushed_at, :naive_datetime
    field :stargazers_count, :integer
    field :topics, {:array, :string}
    field :updated_at, :naive_datetime
    field :watchers_count, :integer
    
    embeds_one :owner, User

    timestamps([{:updated_at, :_updated_at}])
  end

  @doc false
  def changeset(%Repository{} = repository, attrs) do
    #owner = map_user(attrs["owner"])
    repository
    |> cast(attrs, [:name, :full_name, :description, :private, :html_url, :homepage, :language, :forks_count, :stargazers_count, :watchers_count, :open_issues_count, :topics, :pushed_at, :created_at, :updated_at, :license])
  end

  defp map_user(user) do
    map = for {key, val} <- user, into: %{}, do: {String.to_atom(key), val}
    struct(User, map)
  end
end
