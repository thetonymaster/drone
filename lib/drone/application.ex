defmodule Drone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: Drone.TaskSupervisor},
      Supervisor.child_spec({Task, fn -> Drone.accept(4040) end}, restart: :permanent)
    ]

    opts = [strategy: :one_for_one, name: Drone.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
