defmodule DudenApiWeb.SearchController do
  use DudenApiWeb, :controller

  alias DudenApiWeb.Schema.ApiResponse

  defp perform_search(word, conn) do
    word
    |> Duden.search()
    |> case do
      {:ok, results = []} ->
        conn
        |> put_status(404)
        |> json(ApiResponse.not_found())

      {:ok, results} ->
        conn
        |> put_status(200)
        |> json(ApiResponse.ok(results))
    end
  end

  def search(conn, %{"query" => query} = params) do
    perform_search(query, conn)
  end

  def search(conn, %{"q" => query} = params) do
    perform_search(query, conn)
  end

  def search(conn, _params) do
    conn
    |> put_status(400)
    |> json(ApiResponse.client_error("no search query"))
  end
end
