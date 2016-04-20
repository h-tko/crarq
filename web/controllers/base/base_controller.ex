defmodule ChildRearingQuestion.BaseController do

  defmacro __using__(__opts) do
    quote do
      use ChildRearingQuestion.Web, :controller
      alias ChildRearingQuestion.YamlManager

      def rend(conn, key, html, data) do
        heading_yml = YamlManager.get("html_heading")
        data = Map.put(data[:data], :heading, heading_yml[key])

        render(conn, html, data: data)
      end

    end
  end
end
