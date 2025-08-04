defmodule CoasterBusters.Coasters do
  @moduledoc """
  The Coasters context
  """
  alias CoasterBusters.Coasters.Coaster
  alias CoasterBusters.Coasters.Type
  alias CoasterBusters.Repo

  @doc """
  Returns the list of coasters
  """
  @spec list_coasters() :: list(Coaster.t())
  def list_coasters() do
    Repo.all(Coaster)
    |> Repo.preload([:park, :manufacturer])
  end

  @doc """
  Returns the list of coaster types
  """
  @spec list_coaster_types() :: list(Type.t())
  def list_coaster_types() do
    Repo.all(Type)
  end
end
