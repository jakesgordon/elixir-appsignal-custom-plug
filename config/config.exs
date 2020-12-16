use Mix.Config

config :chip, ChipWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nDxE+2coRge5RIz3OVsP/VmKw1pN2Rya2xFStnS+IiLQftDcPdL2XbaOpWYLzOoC",
  render_errors: [view: ChipWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chip.PubSub

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :appsignal, :config,
  otp_app: :chip,
  name: "chip",
  push_api_key: "52eb03d6-996b-4c83-a698-ff6686de73b3",
  env: Mix.env

import_config "#{Mix.env()}.exs"
