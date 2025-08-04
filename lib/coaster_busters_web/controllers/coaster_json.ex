defmodule CoasterBustersWeb.CoasterJSON do
  alias CoasterBusters.Coasters.Coaster
  alias CoasterBusters.Coasters.Type

  def index(%{coasters: coasters}) do
    response = for coaster <- coasters, do: data(coaster)
    %{data: response}
  end

  def types(%{types: types}) do
    response = for type <- types, do: data(type)
    %{data: response}
  end

  defp data(%Coaster{} = coaster) do
    %{
      name: coaster.name
    }
  end

  defp data(%Type{} = type) do
    %{name: type.name}
  end
end
