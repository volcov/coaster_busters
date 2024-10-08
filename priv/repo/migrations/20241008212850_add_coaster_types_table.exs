defmodule CoasterBusters.Repo.Migrations.AddCoasterTypesTable do
  use Ecto.Migration

  def change do
    create table("coaster_types") do
      add :name, :string
      add :description, :string
    end
  end
end
