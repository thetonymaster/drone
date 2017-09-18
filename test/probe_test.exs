defmodule Drone.ProbeTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, probe} = start_supervised(Drone.Probe)
    %{probe: probe}
  end

  test "stores value by key", %{probe: probe} do

    Drone.Probe.put(probe, "status", "hello")

    assert Drone.Probe.get(probe, "status") == "hello"
  end
end
