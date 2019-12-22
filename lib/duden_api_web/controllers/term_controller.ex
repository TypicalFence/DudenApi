defmodule DudenApiWeb.TermController do
  use DudenApiWeb, :controller

  alias DudenApiWeb.Schema.ApiResponse

  def show(conn, %{"id" => id} = params) do
    id
    |> Duden.fetch_term()
    |> case do
      {:ok, term} ->
        conn
        |> put_status(200)
        |> json(ApiResponse.ok(term))

      {:error, :term_not_found} ->
        conn
        |> put_status(404)
        |> json(ApiResponse.not_found())

      {:error, _} ->
        conn
        |> put_status(500)
        |> json(ApiResponse.internal_error())
    end
  end
end
