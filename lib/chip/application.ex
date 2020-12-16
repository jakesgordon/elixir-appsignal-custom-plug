defmodule Chip.Application do
  use Application

  def start(_type, _args) do
    children = [
      ChipWeb.Telemetry,
      {Phoenix.PubSub, name: Chip.PubSub},
      ChipWeb.Endpoint
    ]
    opts = [strategy: :one_for_one, name: Chip.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ChipWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
