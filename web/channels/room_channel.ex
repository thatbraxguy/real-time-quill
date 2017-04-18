defmodule Quickquill.RoomChannel do
  use Phoenix.Channel
  
  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("delta", %{"delta" => delta}, socket) do
    IO.inspect(delta)
    broadcast_from! socket, "delta", %{delta: delta}
    {:noreply, socket}
  end

  def handle_out("delta", payload, socket) do
    push socket, "delta", payload
    {:noreply, socket}
  end
end