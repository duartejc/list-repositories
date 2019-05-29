defmodule RepoFetcher.Repos.GitHub.Models.Repository do
  @moduledoc """
  Repository struct definition module
  """

  alias RepoFetcher.Repos.GitHub.Models.User

  defstruct [
    id: nil, 
    node_id: nil,
    name: nil, 
    full_name: nil, 
    description: nil, 
    private: nil, 
    fork: false,
    url: nil,
    html_url: nil,
    homepage: nil, 
    language: nil, 
    forks_count: nil, 
    stargazers_count: nil, 
    watchers_count: nil, 
    size: nil, 
    default_branch: nil, 
    master_branch: nil,
    open_issues_count: nil, 
    topics: [], 
    pushed_at: nil, 
    created_at: nil, 
    updated_at: nil, 
    license: nil,
    languages_url: nil,
    owner: nil
  ]

  @doc """
  Creates a tagged map which offers compile time checks on the key based on struct.
  """
  def new(attributes) do
    %__MODULE__{
      id: attributes[:id],
      node_id: attributes[:node_id],
      name: attributes[:name],
      full_name: attributes[:full_name],
      description: attributes[:description],
      private: attributes[:private],
      fork: attributes[:fork],
      url: attributes[:url],
      html_url: attributes[:html_url],
      homepage: attributes[:homepage],
      language: attributes[:language],
      forks_count: attributes[:forks_count],
      stargazers_count: attributes[:stargazers_count],
      watchers_count: attributes[:watchers_count],
      size: attributes[:size],
      default_branch: attributes[:default_branch],
      master_branch: attributes[:master_branch],
      open_issues_count: attributes[:open_issues_count],
      topics: attributes[:topics],
      pushed_at: attributes[:pushed_at],
      created_at: attributes[:created_at],
      updated_at: attributes[:updated_at],
      license: attributes[:license],
      languages_url: attributes[:languages_url],
      owner: User.new(attributes[:owner])
    }
  end

end