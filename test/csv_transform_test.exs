defmodule CsvTransformTest do
  use ExUnit.Case
  doctest CsvTransform

  test "First column is an array." do
    row =
      CsvTransform.transform_relative("../test/test.csv", %{})
      |> Enum.take(1)

    assert row == [["column1", "column2"]]

    row =
      "../test/test.csv"
      |> Path.expand(__DIR__)
      |> CsvTransform.transform(%{})
      |> Enum.take(1)

    assert row == [["column1", "column2"]]
  end
end
