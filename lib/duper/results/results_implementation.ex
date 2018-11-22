defmodule Duper.Results.Implementation do
  @one 1
  @first 1

  def add_record_to_results results, hash, path do
    Map.update(
      results,
      hash,
      [path],
      fn exsisting -> [path | exsisting] end
    )
  end

  def find_hashes_with_more_then_one_result results do
    results
    |> Enum.filter(fn {_hash, pathes} -> length(pathes) > @one end)
    |> Enum.map(&elem(&1, @first))
  end

end
