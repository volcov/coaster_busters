defmodule CoasterBustersWeb.CoasterControllerTest do
  use CoasterBustersWeb.ConnCase, async: true
  import CoasterBusters.Factory

  test "list all coaster on the index" do
    insert(:coaster)
    conn = get(build_conn(), "/api/coasters")
    assert conn.resp_body == "{\"data\":[{\"name\":\"Jurassic World Velocicoaster\"}]}"
  end
end
