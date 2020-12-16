defmodule ChipWeb.PageController do
  use ChipWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
