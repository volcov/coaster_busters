defmodule CoasterBustersWeb.CoasterLive do
  use CoasterBustersWeb, :live_view

  alias CoasterBusters.Coasters

  def mount(_params, _session, socket) do
    coasters = Coasters.list_coasters()
    {:ok, assign(socket, coasters: coasters)}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <!-- Navbar -->
      <nav class="bg-white shadow-lg border-b border-gray-200">
        <div class="w-full px-4 sm:px-6 lg:px-8">
          <div class="flex justify-between h-16">
            <div class="flex items-center">
              <div class="flex-shrink-0">
                <a href="/" class="text-2xl font-bold text-indigo-600 hover:text-indigo-800 transition-colors duration-200">
                  🎢 CoasterBusters
                </a>
              </div>
            </div>

            <div class="flex items-center space-x-8">
              <a href="/coasters" class="text-indigo-600 font-medium px-3 py-2 rounded-md text-sm transition-colors duration-200">
                🎢 Coasters
              </a>
              <a href="#" class="text-gray-700 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition-colors duration-200">
                🏭 Manufacturers
              </a>
              <a href="#" class="text-gray-700 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition-colors duration-200">
                🎡 Parks
              </a>
            </div>
          </div>
        </div>
      </nav>

      <!-- Main Content -->
      <main class="w-full py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-7xl mx-auto">
          <!-- Header -->
          <div class="text-center mb-12">
            <h1 class="text-4xl font-extrabold text-gray-900 sm:text-5xl md:text-6xl">
              🎢 <span class="text-indigo-600">Coasters</span>
            </h1>
            <p class="mt-3 max-w-md mx-auto text-base text-gray-500 sm:text-lg md:mt-5 md:text-xl md:max-w-3xl">
              Descubra as montanhas russas mais incríveis do mundo
            </p>
          </div>

          <!-- Coasters Grid -->
          <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
            <%= for coaster <- @coasters do %>
              <div class="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200 overflow-hidden">
                <div class="p-6">
                  <div class="flex items-center justify-between mb-4">
                    <h3 class="text-lg font-semibold text-gray-900 truncate">
                      <%= coaster.name %>
                    </h3>
                    <span class={[
                      "px-2 py-1 text-xs font-medium rounded-full",
                      status_color(coaster.status)
                    ]}>
                      <%= status_text(coaster.status) %>
                    </span>
                  </div>

                  <div class="space-y-3">
                    <%= if coaster.height do %>
                      <div class="flex items-center text-sm text-gray-600">
                        <span class="mr-2">📏</span>
                        <span>Altura: <%= coaster.height %>m</span>
                      </div>
                    <% end %>

                    <%= if coaster.length do %>
                      <div class="flex items-center text-sm text-gray-600">
                        <span class="mr-2">📐</span>
                        <span>Comprimento: <%= coaster.length %>m</span>
                      </div>
                    <% end %>

                    <%= if coaster.top_speed do %>
                      <div class="flex items-center text-sm text-gray-600">
                        <span class="mr-2">⚡</span>
                        <span>Velocidade: <%= coaster.top_speed %>km/h</span>
                      </div>
                    <% end %>

                    <%= if coaster.inversions do %>
                      <div class="flex items-center text-sm text-gray-600">
                        <span class="mr-2">🔄</span>
                        <span>Inversões: <%= coaster.inversions %></span>
                      </div>
                    <% end %>

                    <%= if coaster.park do %>
                      <div class="flex items-center text-sm text-gray-600">
                        <span class="mr-2">🎡</span>
                        <span class="truncate"><%= coaster.park.name %></span>
                      </div>
                    <% end %>

                    <%= if coaster.manufacturer do %>
                      <div class="flex items-center text-sm text-gray-600">
                        <span class="mr-2">🏭</span>
                        <span class="truncate"><%= coaster.manufacturer.name %></span>
                      </div>
                    <% end %>
                  </div>
                </div>
              </div>
            <% end %>
          </div>

          <!-- Empty State -->
          <%= if Enum.empty?(@coasters) do %>
            <div class="text-center py-12">
              <div class="text-6xl mb-4">🎢</div>
              <h3 class="text-lg font-medium text-gray-900 mb-2">Nenhum coaster encontrado</h3>
              <p class="text-gray-500">Adicione alguns coasters para começar!</p>
            </div>
          <% end %>
        </div>
      </main>
    </div>
    """
  end

  defp status_color(:operating), do: "bg-green-100 text-green-800"
  defp status_color(:permanently_closed), do: "bg-red-100 text-red-800"
  defp status_color(:temporarily_closed), do: "bg-yellow-100 text-yellow-800"
  defp status_color(:building), do: "bg-blue-100 text-blue-800"
  defp status_color(_), do: "bg-gray-100 text-gray-800"

  defp status_text(:operating), do: "Operando"
  defp status_text(:permanently_closed), do: "Fechado"
  defp status_text(:temporarily_closed), do: "Temporariamente Fechado"
  defp status_text(:building), do: "Em Construção"
  defp status_text(_), do: "Desconhecido"
end
