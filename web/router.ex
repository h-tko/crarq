defmodule ChildRearingQuestion.Router do
  use ChildRearingQuestion.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChildRearingQuestion do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # 登録系
    get "/entry/", EntryController, :index
    post "/entry/confirm/", EntryController, :confirm
    post "/entry/submit/", EntryController, :submit

    # アンケート一覧
    get "/enquete_list/", EnqueteListController, :index
    get "/enquete_list/detail/:id/", EnqueteListController, :detail
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChildRearingQuestion do
  #   pipe_through :api
  # end
end
