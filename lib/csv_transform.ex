defmodule CsvTransform do
  @moduledoc false

  alias CSV

  def transform(filename, _mapping) do
    filename
    |> read()
  end

  def transform_relative(filename, mapping) do
    filename
    |> Path.expand(__DIR__)
    |> transform(mapping)
  end

  defp read(filename) do
    extension = Path.extname(filename)
    character = separator(extension)

    filename
    |> File.stream!()
    |> CSV.decode!(separator: character)
  end

  defp separator(".csv"), do: ?,
  defp separator(".txt"), do: ?\t
end
