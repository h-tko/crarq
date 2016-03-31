ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ChildRearingQuestion.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ChildRearingQuestion.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ChildRearingQuestion.Repo)

