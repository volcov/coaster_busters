defmodule CoasterBusters.Parks.Park do
  @moduledoc """
  schema module for Park
  """

  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name location website)a
  @fields ~w(name location website operating_season)a

  schema "parks" do
    field :name, :string
    field :location, :string
    field :website, :string

    field :operating_season, {:array, Ecto.Enum},
      values: [:winter, :spring, :autumn, :summer, :all_seasons],
      default: []
  end

  def changeset(park, params \\ %{}) do
    park
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
