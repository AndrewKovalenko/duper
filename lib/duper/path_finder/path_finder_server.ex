defmodule Duper.PathFinder.Server do
  use GenServer

  @me __MODULE__

  def start_link(root_dir), do: GenServer.start_link(@me, root_dir, name: :path_server)

  def init(dir), do: DirWalker.start_link(dir)

  def handle_call(:next_path, _from, dirWalker) do
    path = case DirWalker.next(dirWalker) do
      [path] -> path
      other -> other
    end

    {:reply, path, dirWalker}
  end
end
