defmodule CoasterBusters.Factory do
  use ExMachina.Ecto, repo: CoasterBusters.Repo

  def coaster_factory do
    %CoasterBusters.Coasters.Coaster{
      name: "Jurassic World Velocicoaster",
      height: 47,
      length: 1432,
      top_speed: 113,
      inversions: 4,
      status: :operating
    }
  end
end
