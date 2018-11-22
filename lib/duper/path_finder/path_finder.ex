defmodule Duper.PathFinder do
  def next_path, do: GenServer.call(:path_server, :next_path)

end
