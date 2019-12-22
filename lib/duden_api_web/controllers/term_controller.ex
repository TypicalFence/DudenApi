defmodule DudenApiWeb.TermController do
  use DudenApiWeb, :controller

  def show(conn, %{"id" => id} = params) do
    id
    |> Duden.fetch_term()
    |> case do
      {:ok, term} ->
        conn
        |> json(term)
    end
  end
end
