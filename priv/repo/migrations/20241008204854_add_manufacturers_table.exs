defmodule CoasterBusters.Repo.Migrations.AddManufacturersTable do
  use Ecto.Migration

  def change do
    create table("manufacturers") do
      add :name, :string
      add :country, :string
      add :founded, :integer
      add :website, :string
    end
  end
end
