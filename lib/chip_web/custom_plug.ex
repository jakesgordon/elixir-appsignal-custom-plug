defmodule ChipWeb.CustomPlug do

  alias Plug.Conn

  def init(opts) do
    opts
  end

  def call(%Conn{ path_info: [ "custom" ] } = conn, _opts) do
    # TODO: this instrumentation doesn't seem to make it to AppSignal
    Appsignal.instrument "ChipWeb.CustomPlug", fn ->
      Process.sleep(1000)
      conn

      # By halting the response the rest of the plugs aren't called anymore,
      # so the parent span (the one started by Phoenix in this example) is never closed.
      # The child span, which _is_ closed, therefor gets dropped.

      # |> Conn.send_resp(200, "special case handling of /custom endpoint")
      # |> Conn.halt
    end
  end

  def call(%Conn{} = conn, _opts) do
    conn
  end

end
