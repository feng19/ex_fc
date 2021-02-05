use Mix.Config

port = String.to_integer(System.get_env("FC_SERVER_PORT") || "9000")

config :ex_fc, ExFcWeb.Endpoint,
  server: true,
  http: [port: port],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info
