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
end
