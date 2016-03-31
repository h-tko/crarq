# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :child_rearing_question, ChildRearingQuestion.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "NAMVUNk7Ljb5+Pabs/tLrqd7v74cYYOQwBDx8iDOZ5tPd+z7aFibubK7fwnT2LIL",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ChildRearingQuestion.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :plug_session_redis, :config,
  name: :redis_sessions,
  pool: [size: 2, max_overflow: 5],
  redis: [host: '127.0.0.1', port: 6379]
