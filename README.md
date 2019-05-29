# Repolist

Demo application built with Phoenix and React.

It fetches repositories from GitHub API and shows featured repositories according choosen languages.

## Live Demo

https://stormy-forest-37007.herokuapp.com/#/

## Apps

This application was created following the concept of "umbrella projects" of Elixir.
There are two application under this mais project:

- [RepoFetcher](apps/repo_fetcher): A repository fetcher responsible to fetching data from GitHub API.
- [RepolistWeb](apps/repolist_web): A web application project using the Phoenix framework.

## Setup

    $ git clone https://github.com/duartejc/list-repositories.git
    $ cd list-repositories
    $ mix deps.get
    $ (cd apps/repolist_web && mix ecto.setup)
    $ (cd apps/repolist_web && npm install)
    $ mix phoenix.server
    $ open http://localhost:4000

