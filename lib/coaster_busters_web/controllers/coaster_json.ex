defmodule CoasterBustersWeb.CoasterJSON do
  alias CoasterBusters.Coasters.Coaster

  def index(%{coasters: coasters}) do
    response = for coaster <- coasters, do: data(coaster)
    %{data: response}
  end

  defp data(%Coaster{} = coaster) do
    %{
      name: coaster.name
    }
  end
end
