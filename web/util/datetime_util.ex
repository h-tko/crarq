defmodule ChildRearingQuestion.DatetimeUtil do

  def get_current_date_string() do
    {date, _} = :calendar.local_time

    Integer.to_string(elem(date, 0)) <> "-" <> Integer.to_string(elem(date, 1)) <> "-" <> Integer.to_string(elem(date, 2))
  end

  def get_current_date() do
    {date, _} = :calendar.local_time
    date
  end
end
