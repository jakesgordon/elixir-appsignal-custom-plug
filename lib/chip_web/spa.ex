defmodule ChipWeb.Spa do

  alias Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts \\ []) do
    conn
    |> route
  end

  defp route(%Conn{ path_info: [ "spa" ] } = conn) do
    IO.puts "************ RENDER SPA ***************"
    Process.sleep(1000)
    conn
    |> Conn.send_resp(200, "SPA!")
    |> Conn.halt
  end

  defp route(%Conn{} = conn) do
    conn
  end

end 
