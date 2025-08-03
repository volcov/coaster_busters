defmodule CoasterBustersWeb.HomeLive do
  use CoasterBustersWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
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
                <h1 class="text-2xl font-bold text-indigo-600">🎢 CoasterBusters</h1>
              </div>
            </div>

            <div class="flex items-center space-x-8">
              <a href="#" class="text-gray-700 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition-colors duration-200">
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
        <div class="text-center">
          <h1 class="text-4xl font-extrabold text-gray-900 sm:text-5xl md:text-6xl">
            Bem-vindo ao
            <span class="text-indigo-600">CoasterBusters</span>
          </h1>
          <p class="mt-3 max-w-md mx-auto text-base text-gray-500 sm:text-lg md:mt-5 md:text-xl md:max-w-3xl">
            Descubra as montanhas russas mais incríveis do mundo, seus fabricantes e os parques que as abrigam.
          </p>

          <div class="mt-10">
            <div class="grid grid-cols-1 gap-8 sm:grid-cols-3 lg:grid-cols-3 max-w-6xl mx-auto">
              <!-- Coasters Card -->
              <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow duration-200">
                <div class="text-4xl mb-4">🎢</div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Coasters</h3>
                <p class="text-gray-600 text-sm">Explore as montanhas russas mais emocionantes do mundo</p>
              </div>

              <!-- Manufacturers Card -->
              <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow duration-200">
                <div class="text-4xl mb-4">🏭</div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Manufacturers</h3>
                <p class="text-gray-600 text-sm">Conheça os fabricantes que criam essas maravilhas</p>
              </div>

              <!-- Parks Card -->
              <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow duration-200">
                <div class="text-4xl mb-4">🎡</div>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Parks</h3>
                <p class="text-gray-600 text-sm">Descubra os parques que abrigam essas atrações</p>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
    """
  end
end
