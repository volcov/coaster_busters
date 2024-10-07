defmodule CoasterBusters.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CoasterBustersWeb.Telemetry,
      CoasterBusters.Repo,
      {DNSCluster, query: Application.get_env(:coaster_busters, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CoasterBusters.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CoasterBusters.Finch},
      # Start a worker by calling: CoasterBusters.Worker.start_link(arg)
      # {CoasterBusters.Worker, arg},
      # Start to serve requests, typically the last entry
      CoasterBustersWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoasterBusters.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CoasterBustersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
