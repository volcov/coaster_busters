defmodule CoasterBusters.Repo.Migrations.AddCoastersTable do
  use Ecto.Migration

  def change do
    create table("coasters") do
      add :name, :string
      add :height, :integer
      add :length, :integer
      add :top_speed, :integer
      add :inversions, :integer
      add :status, :string

      add :park_id, references(:parks)
      add :manufacturer_id, references(:manufacturers)
    end

    create table("coasters_types") do
      add :coaster_id, references(:coasters)
      add :coaster_type_id, references(:coaster_types)
    end

    create unique_index(:coasters_types, [:coaster_id, :coaster_type_id])
  end
end
