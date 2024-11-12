defmodule CoasterBusters.Manufacturers.Manufacturer do
  @moduledoc """
  schema module for Manufacturer
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias CoasterBusters.Coasters.Coaster

  @type t :: %__MODULE__{
          name: String.t(),
          country: String.t(),
          founded: non_neg_integer(),
          website: String.t(),
          coasters: list(Coaster)
        }

  @required_fields ~w(name country website)a
  @fields ~w(name country founded website)a

  schema "manufacturers" do
    field :name, :string
    field :country, :string
    field :founded, :integer
    field :website, :string

    has_many :coasters, Coaster
  end

  def changeset(manufacturer, params \\ %{}) do
    manufacturer
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
