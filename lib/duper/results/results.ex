defmodule Duper.Results do
  def add_result path, hash do
    GenServer.cast(:results_server, {:add, path, hash})
  end

  def get_duplicates do
    GenServer.call(:results_server, {:find_duplicates})
  end
end
