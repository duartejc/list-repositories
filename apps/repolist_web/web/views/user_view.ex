defmodule RepolistWeb.UserView do
  use RepolistWeb.Web, :view
  alias RepolistWeb.UserView

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      login: user.login,
      avatar_url: user.avatar_url,
      gravatar_id: user.gravatar_id,
      site_admin: user.site_admin}
  end
end
