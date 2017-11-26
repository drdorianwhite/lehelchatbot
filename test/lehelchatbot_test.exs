defmodule LehelchatbotTest do
  use ExUnit.Case
  doctest Lehelchatbot

  test "greets the world" do
    assert Lehelchatbot.hello() == :world
  end
end
