defmodule YojeeAssignmentSep29SimpleTwitterApp.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :creator, :string
      add :body, :string
      add :retweets_count, :integer

      timestamps()
    end

  end
end
