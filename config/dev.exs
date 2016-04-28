use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :child_rearing_question, ChildRearingQuestion.Endpoint,
  http: [port: 4000],
  https: [port: 4433,
          keyfile: Path.expand("priv/ssl/localhost.key"),
          certfile: Path.expand("priv/ssl/localhost.crt")],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :child_rearing_question, ChildRearingQuestion.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|jsx|css|png|jpeg|jpg|gif|svg|ico)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex|slim|slime)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

#config :plug_session_redis, :config,
#  name: :redis_sessions,
#  pool: [size: 2, max_overflow: 5],
#  redis: [host: '127.0.0.1', port: 6379]

config :plug_session_memcached,
  server: ['127.0.0.1', 11211]

# Configure your database
config :child_rearing_question, ChildRearingQuestion.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "appuser",
  password: "apppass",
  database: "child_rearing_question_dev",
  hostname: "localhost",
  pool_size: 10
