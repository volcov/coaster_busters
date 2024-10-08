defmodule CoasterBusters.Repo.Migrations.AddParksTable do
  use Ecto.Migration

  def change do
    create table("parks") do
      add :name, :string
      add :location, :string
      add :website, :string
      add :operating_season, {:array, :string}
    end
  end
end
