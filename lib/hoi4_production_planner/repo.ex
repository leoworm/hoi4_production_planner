defmodule Hoi4ProductionPlanner.Repo do
  use Ecto.Repo,
    otp_app: :hoi4_production_planner,
    adapter: Ecto.Adapters.Postgres
end
