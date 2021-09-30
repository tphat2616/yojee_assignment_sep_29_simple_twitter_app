# Yojee's assignment sep-29: simple twitter app

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `iex -S mix phx.server`
  * Testing with unit tests: `mix test`

## Recommended environments

  * Elixir version 1.12.1 (Erlang/OTP 22)
  * Phoenix version 1.5.13
  * Postgres ~> 12.4.0

## Problem

  * The goal of this exercise is to Implement a very basic version of Twitter.

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