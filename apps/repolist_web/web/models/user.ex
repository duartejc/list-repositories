defmodule RepolistWeb.User do
  @moduledoc """
  User model module
  """
  use RepolistWeb.Web, :model

  embedded_schema do
    field :avatar_url, :string
    field :gravatar_id, :string
    field :login, :string
    field :site_admin, :boolean, default: false
  end

end
