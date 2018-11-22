defmodule Duper.Gatherer.Server do
  use GenServer

  alias Duper.Gatherer.Implementation

  def start_link(worker_count),
    do: GenServer.start_link(__MODULE__, worker_count, name: :gatherer_server)

  def init(workers_count) do
    Process.send_after(self(), :gatherer_started, 0)
    {:ok, workers_count}
  end

  def handle_info(:gatherer_started, workers_count) do
    1..workers_count
    |> Enum.each(fn _ -> Duper.HashCalculator.Supervisor.add_worker() end)
    {:noreply, workers_count}
  end

  def handle_cast :done, _workers_count = 1 do
    Implementation.report_results()
    System.halt()
  end

  def handle_cast :done, workers_count do
    {:noreply, workers_count - 1}
  end

  def handle_cast {:result, path, hash}, workers_count do
    Duper.Results.add_result(path, hash)
    {:noreply, workers_count}
  end
end
