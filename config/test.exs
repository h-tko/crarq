use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :child_rearing_question, ChildRearingQuestion.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :child_rearing_question, ChildRearingQuestion.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "child_rearing_question_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
