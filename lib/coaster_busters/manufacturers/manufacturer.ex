defmodule CoasterBusters.Manufacturers.Manufacturer do
  @moduledoc """
  schema module for Manufacturer
  """

  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name country website)a
  @fields ~w(name country founded website)a

  schema "manufacturers" do
    field :name, :string
    field :country, :string
    field :founded, :integer
    field :website, :string

    def changeset(manufacturer, params \\ %{}) do
      manufacturer
      |> cast(params, @fields)
      |> validate_required(@required_fields)
    end
  end
end
