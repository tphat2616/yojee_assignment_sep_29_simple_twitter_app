defmodule YojeeAssignmentSep29SimpleTwitterAppWeb.TweetLive.Show do
  use YojeeAssignmentSep29SimpleTwitterAppWeb, :live_view

  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:tweet, Timeline.get_tweet!(id))}
  end

  defp page_title(:show), do: "Show Tweet"
  defp page_title(:edit), do: "Edit Tweet"
end
