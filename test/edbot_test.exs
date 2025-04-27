defmodule EdbotTest do
  use ExUnit.Case
  doctest Edbot

  test "greets the world" do
    assert Edbot.hello() == :world
  end
end
