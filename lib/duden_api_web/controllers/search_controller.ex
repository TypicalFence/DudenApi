defmodule DudenApiWeb.SearchController do
  use DudenApiWeb, :controller

  defp perform_search(word, conn) do
    word
    |> Duden.search()
    |> case do
      {:ok, results} ->
        conn
        |> json(%{results: results})
    end
  end

  def search(conn, %{"query" => query} = params) do
    perform_search(query, conn)
  end

  def search(conn, %{q: query}) do
    perform_search(query, conn)
  end

  def search(conn, _params) do
    conn
    |> json(%{status: 400})
  end

end
