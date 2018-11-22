defmodule Duper.ResultsTest do
  use ExUnit.Case
  alias Duper.Results

  test "stores results properly" do
    Results.add_result("path1", 123)
    Results.add_result("path2", 123)
    Results.add_result("path3", 234)
    Results.add_result("path4", 234)
    Results.add_result("path5", 345)

    duplicates = Results.get_duplicates()

    assert length(duplicates) == 2
  end
end
