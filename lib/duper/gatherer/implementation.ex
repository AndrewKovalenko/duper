defmodule Duper.Gatherer.Implementation do

  def report_results do
    Duper.Results.get_duplicates()
    |> Enum.each(&IO.inspect/1)
  end

end
