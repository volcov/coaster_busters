defmodule CoasterBusters.Coasters.Coaster do
  @moduledoc """
  schema module for Coaster
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias CoasterBusters.Coasters.Type
  alias CoasterBusters.Manufacturers.Manufacturer
  alias CoasterBusters.Parks.Park

  @type t :: %__MODULE__{
          name: String.t(),
          height: non_neg_integer(),
          length: non_neg_integer(),
          top_speed: non_neg_integer(),
          inversions: non_neg_integer(),
          status: atom(),
          park: Park.t(),
          manufacturer: Manufacturer.t(),
          types: list(Type)
        }

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

    belongs_to :park, Park
    belongs_to :manufacturer, Manufacturer

    many_to_many :types, CoasterBusters.Coasters.Type,
      join_through: "coasters_types",
      join_keys: [coaster_id: :id, coaster_type_id: :id]
  end

  def changeset(coaster, params \\ %{}) do
    coaster
    |> cast(params, @fields)
    |> put_assoc(:park, Map.get(params, :park))
    |> put_assoc(:manufacturer, Map.get(params, :manufacturer))
    |> put_assoc(:types, Map.get(params, :types))
    |> validate_required(@required_fields)
  end
end
