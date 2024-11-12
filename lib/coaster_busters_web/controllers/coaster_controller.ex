defmodule CoasterBustersWeb.CoasterController do
  use CoasterBustersWeb, :controller

  alias CoasterBusters.Coasters

  def index(conn, _params) do
    costers = Coasters.list_coasters()
    render(conn, :index, coasters: costers)
  end
end
