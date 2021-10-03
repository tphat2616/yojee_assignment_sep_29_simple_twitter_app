defmodule YojeeAssignmentSep29SimpleTwitterApp.Repo do
  use Ecto.Repo,
    otp_app: :yojee_assignment_sep_29_simple_twitter_app,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
end
