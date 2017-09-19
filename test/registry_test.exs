defmodule Drone.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, registry} = start_supervised Drone.Registry
    %{registry: registry}
  end

  test "spawns probes", %{registry: registry} do
    assert Drone.Registry.lookup(registry, "probe") == :error

    Drone.Registry.create(registry, "probe")
    assert {:ok, probe} = Drone.Registry.lookup(registry, "probe")

    Drone.Probe.put(probe, "milk", 1)
    assert Drone.Probe.get(probe, "milk") == 1
  end
end
