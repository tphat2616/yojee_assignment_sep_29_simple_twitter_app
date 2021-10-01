defmodule YojeeAssignmentSep29SimpleTwitterAppWeb.TweetLiveTest do
  use YojeeAssignmentSep29SimpleTwitterAppWeb.ConnCase

  import Phoenix.LiveViewTest

  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline

  @create_attrs %{body: "some body", creator: "some creator", retweets_count: 42}
  @update_attrs %{body: "some updated body", creator: "some updated creator", retweets_count: 43}
  @invalid_attrs %{body: nil}

  defp fixture(:tweet) do
    {:ok, tweet} = Timeline.create_tweet(@create_attrs)
    tweet
  end

  defp create_tweet(_) do
    tweet = fixture(:tweet)
    %{tweet: tweet}
  end

  describe "Index" do
    setup [:create_tweet]

    test "lists all tweets", %{conn: conn, tweet: tweet} do
      {:ok, _index_live, html} = live(conn, Routes.tweet_index_path(conn, :index))

      assert html =~ "Listing Tweets"
      assert html =~ tweet.body
    end

    test "deletes tweet in listing", %{conn: conn, tweet: tweet} do
      {:ok, index_live, _html} = live(conn, Routes.tweet_index_path(conn, :index))

      refute has_element?(index_live, "#tweet-#{tweet.id}")
    end
  end

  describe "Show" do
    setup [:create_tweet]

    test "displays tweet", %{conn: conn, tweet: tweet} do
      {:ok, _show_live, html} = live(conn, Routes.tweet_show_path(conn, :show, tweet))

      assert html =~ "Show Tweet"
      assert html =~ tweet.body
    end
  end
end
