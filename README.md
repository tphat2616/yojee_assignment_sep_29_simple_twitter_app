# Yojee's assignment sep-29: simple twitter app

## Problem

  * The goal of this exercise is to implement a very basic version of Twitter.

## Points to consider

  * User can create a tweet on this page (the twitter will contain just 140 characters long string).
  * Not necessary to implement authentication or any user management.
  * Every tweet is anonymous.
  * Any tweet can be retweeted.
  * In dashboard, should display top 10 tweets. (Ordering is based on the number of retweets the original tweet gets).
  * the data can be maintained in memory.
  * Bonus point: - Deploy online on any cloud.
                 - Have front end design.
  * Extra thought into the top 10 requirement.
  * Design architecture when scales with 1k, 1M, 1T tweets.

## Requirement

  * how the code is organized, best practices, data structures and a basic
    documentation about running the code (readme.md), implementation details and design
    choices.

## Recommended environments

  * Elixir version 1.12.1 (Erlang/OTP 23)
  * Phoenix version 1.5.13
  * Postgres ~> 12.4.0

## Tech Stack Used

  * Phoenix framework + Elixir/Erlang.
  * Phoenix LiveView.
  * Phoenix PubSub.
  * Erlang-OTP/rpc.
  * Scrivener for pagination.
  * Gigalixir for releasing live production (built on top of Heroku).

## Git Repo Description

  * Repo `yojee_assignment_sep_29_simple_twitter_app` for web server. 
  * Repo `gate_way` for Endpoint Server.

## To start your Phoenix server

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `iex -S mix phx.server`

## Run Unit Tests

  * Test entire module: `mix test`
  * Test app module: `mix test test/yojee_assignment_sep_29_simple_twitter_app/`
  * Test webapp module: `mix test test/yojee_assignment_sep_29_simple_twitter_app_web/`

## Run nodes:

  * Run web server: `iex --sname app --cookie aaa --erl "+P 1000000" -S mix phx.server`
  * Run endpoint server: `iex --sname gate_way --cookie aaa --erl "+P 1000000" -S mix`

## Scaling Solution

  * 1_000 TPS: A single BEAM could handle 1_000 TPS very easy with default config.
  * 1_000_000 TPS:
    - Increase number of node and pool_size.
    - Every endpoint node only handles a single endpoint.
    - When requests are sent to web server, it will cast these requests to endpoint server depend on kind of       endpoint through RPC. Look at the picture below:

    ![alt text](../main/assets/static/images/1m_tweets.JPG)