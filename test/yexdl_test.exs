defmodule YexdlTest do
  use ExUnit.Case
  doctest Yexdl

  test "greets the world" do
    assert not is_nil(Yexdl.get_all_source("yjnPOiqGaAc"))
  end
end
