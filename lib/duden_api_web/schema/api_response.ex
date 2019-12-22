defmodule DudenApiWeb.Schema.ApiResponse do
  @derive Jason.Encoder
  @enforce_keys [:status]
  defstruct status: 200,
            msg: "",
            data: nil

  @typedoc "ApiResponse"
  @type t() :: %__MODULE__{
          status: integer,
          msg: String.t(),
          data: term
        }

  def ok() do
    %__MODULE__{status: 200}
  end

  def ok(data) do
    %__MODULE__{status: 200, data: data, msg: "ok"}
  end

  def ok(data, msg) do
    %__MODULE__{status: 200, data: data, msg: msg}
  end

  def internal_error() do
    %__MODULE__{status: 500, msg: "internal error"}
  end

  def internal_error(msg) do
    %__MODULE__{status: 500, msg: msg}
  end

  def client_error() do
    %__MODULE__{status: 400, msg: "client error"}
  end

  def client_error(msg) do
    %__MODULE__{status: 400, msg: msg}
  end

  def not_found() do
    %__MODULE__{status: 404, msg: "not found"}
  end
end
