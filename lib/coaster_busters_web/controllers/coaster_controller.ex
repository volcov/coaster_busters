defmodule CoasterBustersWeb.CoasterController do
  use CoasterBustersWeb, :controller

  alias CoasterBusters.Coasters

  def index(conn, _params) do
    costers = Coasters.list_coasters()
    render(conn, :index, coasters: costers)
  end

  def types(conn, _params) do
    types = Coasters.list_coaster_types()
    render(conn, :types, types: types)
  end
end
