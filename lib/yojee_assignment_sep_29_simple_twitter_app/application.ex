defmodule YojeeAssignmentSep29SimpleTwitterApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      YojeeAssignmentSep29SimpleTwitterApp.Repo,
      # Start the Telemetry supervisor
      YojeeAssignmentSep29SimpleTwitterAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: YojeeAssignmentSep29SimpleTwitterApp.PubSub},
      # Start the Endpoint (http/https)
      YojeeAssignmentSep29SimpleTwitterAppWeb.Endpoint
      # Start a worker by calling: YojeeAssignmentSep29SimpleTwitterApp.Worker.start_link(arg)
      # {YojeeAssignmentSep29SimpleTwitterApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: YojeeAssignmentSep29SimpleTwitterApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    YojeeAssignmentSep29SimpleTwitterAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
