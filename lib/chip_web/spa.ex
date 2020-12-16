defmodule ChipWeb.Spa do

  alias Plug.Conn

  def init(opts) do
    opts
  end

  def call(%Conn{ path_info: [ "spa" ] } = conn, _opts) do
    Appsignal.instrument "Chip.Spa", fn ->
      Process.sleep(1000)
      conn
      |> Conn.send_resp(200, "SPA!")
      |> Conn.halt
    end
  end

  def call(%Conn{} = conn, _opts) do
    conn
  end

end 
