defmodule CoasterBusters.Coasters.Type do
  @moduledoc """
  schema module for Coaster Type
  """

  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name)a
  @fields ~w(name description)a

  schema "coaster_types" do
    field :name, :string
    field :description, :string

    many_to_many :coasters, CoasterBusters.Coasters.Coaster, join_through: "coasters_types"
  end

  def changeset(coaster_type, params \\ %{}) do
    coaster_type
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
