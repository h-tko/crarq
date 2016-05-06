defmodule ChildRearingQuestion.BaseView do
  defmacro __using__(__opt) do
    quote do

      use ChildRearingQuestion.Web, :view

      def add_br(text, length \\ 25) do
        slice_and_add(text, "", length)
      end

      defp slice_and_add(remain, result, length) when remain != "" do

        {bef, remain_res} = String.split_at(remain, length)

        if String.contains? bef, "\r\n" do
          data_list = String.split(bef, "\r\n")
          remain = List.last(data_list) <> remain_res
          last_index = Enum.count(data_list) - 1

          data_list = List.delete_at(data_list, last_index)

          bef_str = for data <- data_list do
            data <> "\r\n"
          end

          result = result <> List.first(bef_str)
        else
            result = result <> "\r\n" <> bef
            remain = remain_res
        end

        slice_and_add(remain, result, length)
      end

      defp slice_and_add(remain, result, length) do
        result = result <> remain
      end
    end
  end
end
