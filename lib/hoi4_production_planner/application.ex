defmodule Hoi4ProductionPlanner.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Hoi4ProductionPlanner.Repo,
      # Start the Telemetry supervisor
      Hoi4ProductionPlannerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hoi4ProductionPlanner.PubSub},
      # Start the Endpoint (http/https)
      Hoi4ProductionPlannerWeb.Endpoint
      # Start a worker by calling: Hoi4ProductionPlanner.Worker.start_link(arg)
      # {Hoi4ProductionPlanner.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hoi4ProductionPlanner.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Hoi4ProductionPlannerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
