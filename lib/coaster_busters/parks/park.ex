defmodule CoasterBusters.Parks.Park do
  @moduledoc """
  schema module for Park
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias CoasterBusters.Coasters.Coaster

  @type t :: %__MODULE__{
          name: String.t(),
          location: String.t(),
          website: String.t(),
          operating_season: atom(),
          coasters: list(Coaster)
        }

  @required_fields ~w(name location website)a
  @fields ~w(name location website operating_season)a

  schema "parks" do
    field :name, :string
    field :location, :string
    field :website, :string

    field :operating_season, {:array, Ecto.Enum},
      values: [:winter, :spring, :autumn, :summer, :all_seasons],
      default: []

    has_many :coasters, Coaster
  end

  def changeset(park, params \\ %{}) do
    park
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
