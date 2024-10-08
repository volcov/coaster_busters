defmodule CoasterBusters.Coasters.Type do
  @moduledoc """
  schema module for Coaster Type
  """

  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name description)a
  @fields ~w(name description)a

  schema "coaster_types" do
    field :name, :string
    field :description, :string
  end

  def changeset(coaster_type, params \\ %{}) do
    coaster_type
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
