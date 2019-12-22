defmodule DudenApiWeb.Router do
  use DudenApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DudenApiWeb do
    pipe_through :api

    get "/search", SearchController, :search

    scope "/term" do
      get "/:id", TermController, :show
    end
  end
end
