defmodule CoasterBusters.Repo.Migrations.AddCoasterTypesTable do
  use Ecto.Migration

  def change do
    create table("coaster_types") do
      add :name, :string
      add :description, :string
    end

    create unique_index(:coaster_types, [:name])
  end
end
