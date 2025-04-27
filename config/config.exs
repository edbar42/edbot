import Config

config :nostrum,
  token: System.get_env("NOSTRUM_TOKEN"),
  gateway_intents: :all
