defmodule YojeeAssignmentSep29SimpleTwitterAppWeb.PageController do
  use YojeeAssignmentSep29SimpleTwitterAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
