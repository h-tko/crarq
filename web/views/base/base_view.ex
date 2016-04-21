defmodule ChildRearingQuestion.BaseView do
  defmacro __using__(__opt) do
    quote do

      use ChildRearingQuestion.Web, :view
    end
  end
end
