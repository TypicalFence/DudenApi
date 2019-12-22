defmodule DudenApiWeb.ErrorView do
  use DudenApiWeb, :view

  alias DudenApiWeb.Schema.ApiResponse

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("500.json", _assigns) do
    ApiResponse.internal_error()
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    status = Phoenix.Controller.status_message_from_template(template)
    ApiResponse.not_found(status)
  end
end
