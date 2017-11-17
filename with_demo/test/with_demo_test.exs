defmodule WithDemoTest do
  use ExUnit.Case
  doctest WithDemo

  test "greets the world" do
    assert WithDemo.hello() == :world
  end
end
