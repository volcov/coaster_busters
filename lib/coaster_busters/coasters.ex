defmodule CoasterBusters.Coasters do
  @moduledoc """
  The Coasters context
  """
  alias CoasterBusters.Coasters.Coaster
  alias CoasterBusters.Repo

  @doc """
  Returns the list of coasters
  """
  @spec list_coasters() :: list(Coaster.t())
  def list_coasters() do
    Repo.all(Coaster)
  end
end
