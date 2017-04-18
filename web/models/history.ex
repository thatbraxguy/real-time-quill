defmodule Quickquill.History do

  def start_link(id) do
    Agent.start_link(fn -> [] end, name: id)
  end

  def put(id, delta) do
    Agent.update(id, fn list -> [delta | list] end)
  end

  def get(id) do
    IO.inspect(id)
    # Agent.get(id, fn list -> list end)
  end
end