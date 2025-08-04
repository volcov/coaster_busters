defmodule CoasterBusters.CoastersTest do
  use CoasterBusters.DataCase
  import CoasterBusters.Factory

  alias CoasterBusters.Coasters

  describe "coasters" do
    test "list_coasters/0 returns all coasters" do
      coaster = insert(:coaster)
      coasters_list = Coasters.list_coasters()
      first_coaster = List.first(coasters_list)

      assert length(coasters_list) == 1
      assert first_coaster.id == coaster.id
    end
  end

  describe "coaster types" do
    test "list_coaster_types/0 returns all coaster types" do
      coaster_type = insert(:type)
      coaster_types_list = Coasters.list_coaster_types()
      first_coaster_type = List.first(coaster_types_list)

      assert length(coaster_types_list) == 1
      assert first_coaster_type.id == coaster_type.id
    end
  end
end
