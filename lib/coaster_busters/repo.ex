defmodule CoasterBusters.Repo do
  use Ecto.Repo,
    otp_app: :coaster_busters,
    adapter: Ecto.Adapters.Postgres
end
