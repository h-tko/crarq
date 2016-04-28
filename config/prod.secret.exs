use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :child_rearing_question, ChildRearingQuestion.Endpoint,
  secret_key_base: "2ZRRN0pGJgK0d6PpabPBy2alPp4yhMxQ7FG6hqC7zaUPJEYqWifeER+/33pTZ9ji"

# Configure your database
config :child_rearing_question, ChildRearingQuestion.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "appuser",
  password: "apppass",
  database: "child_rearing_question_dev",
  hostname: "localhost",
  pool_size: 10
