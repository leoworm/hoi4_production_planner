defmodule Hoi4ProductionPlannerWeb.PageController do
  use Hoi4ProductionPlannerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
