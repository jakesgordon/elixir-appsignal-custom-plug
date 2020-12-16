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

end
