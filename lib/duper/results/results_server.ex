defmodule Duper.Results.Server do
  use GenServer
  import Duper.Results.Implementation

  @me __MODULE__

  def start_link(_), do: GenServer.start_link(@me, :no_args, name: :results_server)

  def init(:no_args), do: {:ok, %{}}

  def handle_cast {:add, path, hash}, results do
    results = add_record_to_results results, hash, path

    {:noreply, results}
  end

  def handle_call {:find_duplicates}, _from, results do
    duplicates = find_hashes_with_more_then_one_result(results)

    {:reply, duplicates, results}
  end
end
