defmodule ChildRearingQuestion.Endpoint do
  use Phoenix.Endpoint, otp_app: :child_rearing_question

  socket "/socket", ChildRearingQuestion.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :child_rearing_question, gzip: false,
    only: ~w(css fonts images js jsx favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  #  plug Plug.Session,
  #    store: :cookie,
  #    key: "_child_rearing_question_key",
  #    signing_salt: "2SRVpeWG"

  plug Plug.Session,
    store: PlugSessionRedis.Store,
    key: "_child_rearing_question_key",
    table: :redis_sessions,
    signing_salt: "2SRVpeWG",
    entryption_salt: "few98gre",
    ttl: 360

  plug ChildRearingQuestion.Router
end
