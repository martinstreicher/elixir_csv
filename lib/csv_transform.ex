defmodule CsvTransform do
  alias CSV

  def transform(_mapping, filename) do
    read(Path.expand(filename, __DIR__))
  end

  defp read(filename) do
    extension = Path.extname(filename)
    character = separator(extension)

    filename
    |> File.stream!()
    |> CSV.decode!(separator: character)
  end

  defp separator(".csv"), do: ","
  defp separator(".txt"), do: "\t"
end

CsvTransform.transform(%{}, '../../file.csv')
