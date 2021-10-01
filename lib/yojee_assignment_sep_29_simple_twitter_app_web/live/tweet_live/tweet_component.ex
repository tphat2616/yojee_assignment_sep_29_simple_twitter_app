defmodule YojeeAssignmentSep29SimpleTwitterAppWeb.TweetLive.TweetComponent do
  use YojeeAssignmentSep29SimpleTwitterAppWeb, :live_component

  alias YojeeAssignmentSep29SimpleTwitterApp.Timeline

  def render(assigns) do
    ~L"""
    <div id="post-<%= @tweet.id %>" class="tweet">
      <div class="row">
        <div class="column column-10">
          <img src="/images/user.png" class="post-avatar"/>
        </div>
        <div class="column column-90 post-body">
          <b>@<%= @tweet.creator %></b>
          <br/>
          <%= @tweet.body %>
        </div>
      </div>

      <div class="row">
        <div class="column tweet-button-column">
          <a href="#" phx-click="retweet" phx-target="<%= @myself %>">
            Retweet
          </a>
          <span><%= @tweet.retweets_count %></span>
        </div>
        <div class="column tweet-button-column">
          <%= live_patch to: Routes.tweet_index_path(@socket, :edit, @tweet.id) do %>
            Edit
          <% end %>
          <%= link to: "#", phx_click: "delete", phx_value_id: @tweet.id do %>
            Delete
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("retweet", _, socket) do
    Timeline.increase_retweets_count(socket.assigns.tweet)
    {:noreply, socket}
  end
end
