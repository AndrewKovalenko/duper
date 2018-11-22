defmodule Duper.Gatherer do
  def result(path, hash), do: GenServer.cast(:gatherer_server, {:result, path, hash})

  def done(), do: GenServer.cast(:gatherer_server, :done)
end
