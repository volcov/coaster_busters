defmodule CoasterBustersWeb.HomeLive do
  use CoasterBustersWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Bem-vindo ao LiveView!</h1>
      <p>Esta é sua primeira página LiveView.</p>

      <div>
        <button phx-click="increment">Clique-me: <%= @count %></button>
      </div>
    </div>
    """
  end

  def handle_event("increment", _, socket) do
    count = socket.assigns.count + 1
    {:noreply, assign(socket, count: count)}
  end
end
