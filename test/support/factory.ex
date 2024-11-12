defmodule CoasterBusters.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: CoasterBusters.Repo

  def coaster_factory do
    %CoasterBusters.Coasters.Coaster{
      name: "Jurassic World Velocicoaster",
      height: 47,
      length: 1432,
      top_speed: 113,
      inversions: 4,
      status: :operating,
      park: build(:park),
      manufacturer: build(:manufacturer),
      types: build_list(1, :type)
    }
  end

  def park_factory do
    %CoasterBusters.Parks.Park{
      name: "Universal's Islands of Adventure",
      location: "Orlando, Florida, USA",
      website: "https://www.universalorlando.com/",
      operating_season: [:all_seasons]
    }
  end

  def manufacturer_factory do
    %CoasterBusters.Manufacturers.Manufacturer{
      name: "Intamin",
      country: "Liechtenstein",
      founded: 1967,
      website: "https://intamin.com"
    }
  end

  def type_factory do
    %CoasterBusters.Coasters.Type{
      name: "Launched",
      description:
        "A launched roller coaster is a type of roller coaster that propels the train to a high speed in a short space of time, sometimes up an incline."
    }
  end
end
