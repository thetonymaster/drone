defmodule Drone.Probe do
  use Agent

  @doc """
  Starts a new probe
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets the state from the probe
  """
  def get(probe, key) do
    Agent.get(probe, &Map.get(&1, key))
  end

  @doc """
  Updates or creates a key on a probe
  """
  def put(probe, key, value) do
    Agent.update(probe, &Map.put(&1, key, value))
  end
end
