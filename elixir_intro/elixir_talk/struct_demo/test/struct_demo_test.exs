defmodule StructDemoTest do
  use ExUnit.Case
  doctest StructDemo

  test "greets the world" do
    assert StructDemo.hello() == :world
  end
end
