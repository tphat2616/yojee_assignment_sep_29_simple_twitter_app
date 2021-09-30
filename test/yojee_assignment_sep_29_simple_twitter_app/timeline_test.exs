defmodule YojeeAssignmentSep29SimpleTwitterApp.TimelineTest do
  use YojeeAssignmentSep29SimpleTwitterApp.DataCase

  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline

  describe "tweets" do
    alias YojeeAssignmentSep29SimpleTwitterApp.Timeline.Tweet

    @valid_attrs %{body: "some body", creator: "some creator", retweets_count: 42}
    @update_attrs %{body: "some updated body", creator: "some updated creator", retweets_count: 43}
    @invalid_attrs %{body: nil, creator: nil, retweets_count: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timeline.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Timeline.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Timeline.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Timeline.create_tweet(@valid_attrs)
      assert tweet.body == "some body"
      assert tweet.creator == "some creator"
      assert tweet.retweets_count == 42
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timeline.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{} = tweet} = Timeline.update_tweet(tweet, @update_attrs)
      assert tweet.body == "some updated body"
      assert tweet.creator == "some updated creator"
      assert tweet.retweets_count == 43
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Timeline.update_tweet(tweet, @invalid_attrs)
      assert tweet == Timeline.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Timeline.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Timeline.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Timeline.change_tweet(tweet)
    end
  end
end
