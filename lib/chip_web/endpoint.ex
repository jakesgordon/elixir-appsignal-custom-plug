defmodule ChipWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :chip
  use Appsignal.Phoenix

  @session_options [
    store: :cookie,
    key: "_chip_key",
    signing_salt: "6d985geB"
  ]

  plug Plug.Static,
    at: "/",
    from: :chip,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options

  # TODO: this custom plug has instrumentation that I can't get to work
  plug ChipWeb.CustomPlug

  plug ChipWeb.Router

end
