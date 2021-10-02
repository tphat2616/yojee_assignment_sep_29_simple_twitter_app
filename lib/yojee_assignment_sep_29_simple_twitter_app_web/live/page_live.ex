defmodule YojeeAssignmentSep29SimpleTwitterAppWeb.PageLive do
  use YojeeAssignmentSep29SimpleTwitterAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end
end
