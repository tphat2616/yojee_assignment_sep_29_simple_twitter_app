defmodule YojeeAssignmentSep29SimpleTwitterAppWeb.TweetLive.Index do
  use YojeeAssignmentSep29SimpleTwitterAppWeb, :live_view
  import Scrivener.HTML

  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline
  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline.Tweet
  alias YojeeAssignmentSep29SimpleTwitterApp.Repo

  @impl true
  def mount(params, _session, socket) do
    if connected?(socket), do: Timeline.subscribe()
    page = Timeline.paginate_tweets(params)
    {:ok, assign(socket, tweets: page.entries, page: page)}
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
    page = Timeline.paginate_tweets()
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_event("create_1k_tweets", params, socket) do
    Timeline.create_1_000_tweets()
    page = Timeline.paginate_tweets(params)
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_event("create_1m_tweets", params, socket) do
    Timeline.create_1_000_000_tweets()
    page = Timeline.paginate_tweets(params)
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_event("truncate_table", params, socket) do
    Timeline.truncate_tweets_table()
    page = Timeline.paginate_tweets(params)
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_info({:tweet_created, _tweet}, socket) do
    page = Timeline.paginate_tweets()
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_info({:tweet_updated, _tweet}, socket) do
    page = Timeline.paginate_tweets()
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_info({:tweet_deleted, _tweet}, socket) do
    page = Timeline.paginate_tweets()
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_info({:truncate_table, _tweet}, socket) do
    page = Timeline.paginate_tweets()
    {:noreply, assign(socket, tweets: page.entries)}
  end

  @impl true
  def handle_info({:create_1_000_tweets, _tweet}, socket) do
    page = Timeline.paginate_tweets()
    {:noreply, assign(socket, tweets: page.entries)}
  end
end
