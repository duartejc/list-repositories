defmodule RepoFetcher.Repos.GitHub.Models.User do
  @moduledoc """
  User struct definition module
  """

  defstruct [
    login: nil,
    id: nil,
    avatar_url: nil,
    gravatar_id: nil,
    url: nil,
    html_url: nil,
    followers_url: nil,
    following_url: nil,
    gists_url: nil,
    starred_url: nil,
    subscriptions_url: nil,
    organizations_url: nil,
    repos_url: nil,
    events_url: nil,
    received_events_url: nil,
    type: nil,
    site_admin: nil
  ]

  @doc """
  Creates a tagged map which offers compile time checks on the key based on struct.
  """
  def new(attributes) do
    %__MODULE__{
      login: attributes[:login],
      id: attributes[:id],
      avatar_url: attributes[:avatar_url],
      gravatar_id: attributes[:gravatar_id],
      url: attributes[:url],
      html_url: attributes[:html_url],
      followers_url: attributes[:followers_url],
      following_url: attributes[:following_url],
      gists_url: attributes[:gists_url],
      starred_url: attributes[:starred_url],
      subscriptions_url: attributes[:subscriptions_url],
      organizations_url: attributes[:organizations_url],
      repos_url: attributes[:repos_url],
      events_url: attributes[:events_url],
      received_events_url: attributes[:received_events_url],
      type: attributes[:type],
      site_admin: attributes[:site_admin]
    }
  end

end