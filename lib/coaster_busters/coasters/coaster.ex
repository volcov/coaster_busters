defmodule CoasterBusters.Coasters.Coaster do
  @moduledoc """
  schema module for Coaster
  """

  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name status park)a
  @fields ~w(name height length top_speed inversions status)a

  schema "coasters" do
    field :name, :string
    field :height, :integer
    field :length, :integer
    field :top_speed, :integer
    field :inversions, :integer

    field :status, Ecto.Enum,
      values: [:operating, :permanently_closed, :temporarily_closed, :building]

    belongs_to :park, CoasterBusters.Parks.Park
    belongs_to :manufacturer, CoasterBusters.Manufacturers.Manufacturer

    many_to_many :types, CoasterBusters.Coasters.Type, join_through: "coasters_types"
  end

  def changeset(coaster, params \\ %{}) do
    coaster
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end