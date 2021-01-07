defmodule ChipWeb.PageController do
  use ChipWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def foo(conn, _params) do
    render(conn, "foo.html")
  end

  def bar(conn, _params) do
    render(conn, "bar.html")
  end

  def custom(conn, _params) do
    conn
  |> send_resp(201, "special case handling of /custom endpoint")
  end

end
