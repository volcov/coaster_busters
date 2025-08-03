# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CoasterBusters.Repo.insert!(%CoasterBusters.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CoasterBusters.Repo
alias CoasterBusters.Parks.Park
alias CoasterBusters.Manufacturers.Manufacturer
alias CoasterBusters.Coasters.Coaster
alias CoasterBusters.Coasters.Type

# Criar parques
disneyland =
  Repo.insert!(%Park{
    name: "Disneyland Park",
    location: "Anaheim, California",
    website: "https://disneyland.disney.go.com"
  })

six_flags =
  Repo.insert!(%Park{
    name: "Six Flags Magic Mountain",
    location: "Valencia, California",
    website: "https://www.sixflags.com/magicmountain"
  })

universal =
  Repo.insert!(%Park{
    name: "Universal Studios",
    location: "Orlando, Florida",
    website: "https://www.universalorlando.com"
  })

# Criar fabricantes
intamin =
  Repo.insert!(%Manufacturer{
    name: "Intamin",
    country: "Switzerland",
    website: "https://www.intamin.com"
  })

bolliger_mabillard =
  Repo.insert!(%Manufacturer{
    name: "Bolliger & Mabillard",
    country: "Switzerland",
    website: "https://www.bolliger-mabillard.com"
  })

vekoma =
  Repo.insert!(%Manufacturer{
    name: "Vekoma",
    country: "Netherlands",
    website: "https://www.vekoma.com"
  })

# Criar tipos de coaster
wooden =
  Repo.insert!(%Type{
    name: "Wooden Coaster"
  })

steel =
  Repo.insert!(%Type{
    name: "Steel Coaster"
  })

inverted =
  Repo.insert!(%Type{
    name: "Inverted Coaster"
  })

# Criar coasters
Repo.insert!(%Coaster{
  name: "Space Mountain",
  height: 28,
  length: 1000,
  top_speed: 56,
  inversions: 0,
  status: :operating,
  park_id: disneyland.id,
  manufacturer_id: intamin.id
})

Repo.insert!(%Coaster{
  name: "X2",
  height: 53,
  length: 1100,
  top_speed: 76,
  inversions: 2,
  status: :operating,
  park_id: six_flags.id,
  manufacturer_id: bolliger_mabillard.id
})

Repo.insert!(%Coaster{
  name: "Hulk",
  height: 35,
  length: 1200,
  top_speed: 67,
  inversions: 1,
  status: :operating,
  park_id: universal.id,
  manufacturer_id: intamin.id
})

Repo.insert!(%Coaster{
  name: "Tatsu",
  height: 47,
  length: 1100,
  top_speed: 62,
  inversions: 3,
  status: :operating,
  park_id: six_flags.id,
  manufacturer_id: bolliger_mabillard.id
})

Repo.insert!(%Coaster{
  name: "Revenge of the Mummy",
  height: 20,
  length: 800,
  top_speed: 45,
  inversions: 0,
  status: :operating,
  park_id: universal.id,
  manufacturer_id: vekoma.id
})

IO.puts("✅ Dados de exemplo criados com sucesso!")
