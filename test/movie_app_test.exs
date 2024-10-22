defmodule MovieAppTest do
  use ExUnit.Case
  doctest MovieApp

  test "greets the world" do
    assert MovieApp.hello() == :world
  end
end
