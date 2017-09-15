defmodule DroneTest do
  use ExUnit.Case
  doctest Drone

  test "greets the world" do
    assert Drone.hello() == :world
  end
end
