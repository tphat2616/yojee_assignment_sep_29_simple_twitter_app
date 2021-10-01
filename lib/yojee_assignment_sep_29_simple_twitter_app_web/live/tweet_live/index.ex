defmodule YojeeAssignmentSep29SimpleTwitterAppWeb.TweetLive.Index do
  use YojeeAssignmentSep29SimpleTwitterAppWeb, :live_view

  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline
  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline.Tweet

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Timeline.subscribe()
    {:ok, assign(socket, :tweets, list_tweets())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Tweet")
    |> assign(:tweet, %Tweet{})
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Tweet")
    |> assign(:tweet, Timeline.get_tweet!(id))
  end


  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tweets")
    |> assign(:tweet, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    tweet = Timeline.get_tweet!(id)
    {:ok, _} = Timeline.delete_tweet(tweet)

    {:noreply, assign(socket, :tweets, list_tweets())}
  end

  @impl true
  def handle_event("create_1k_tweets", _params, socket) do
    Timeline.create_1_000_tweet()
    {:noreply, assign(socket, :tweets, list_tweets())}
  end

  @impl true
  def handle_event("truncate_table", _params, socket) do
    Timeline.truncate_tweets_table()
    {:noreply, assign(socket, :tweets, list_tweets())}
  end

  @impl true
  def handle_info({:tweet_created, _tweet}, socket) do
    {:noreply, assign(socket, :tweets, list_tweets())}
  end

  @impl true
  def handle_info({:tweet_updated, _tweet}, socket) do
    {:noreply, assign(socket, :tweets, list_tweets())}
  end

  @impl true
  def handle_info({:tweet_deleted, _tweet}, socket) do
    {:noreply, assign(socket, :tweets, list_tweets())}
  end

  defp list_tweets do
    Timeline.list_tweets()
  end
end
