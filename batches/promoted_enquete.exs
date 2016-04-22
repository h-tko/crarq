# 投票中アンケートを開催中に昇格させる
defmodule ChildRearingQuestion.PromotedEnquete do
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.YamlManager
  alias ChildRearingQuestion.DatetimeUtil

  def main() do

    # 昇格件数を設定ファイルから取る
    promoted_settings = YamlManager.get("promoted_settings")
    promoted_count = promoted_settings["daily_promoted_count"]

    # 昇格対象のレコードを取得
    enquete_list = Enquete.get_promoted_list(Repo, promoted_count)

    start_date = DatetimeUtil.get_current_date
    start_date = Ecto.Date.cast(start_date)
    case start_date do
      {:ok, start_date} ->

        for enquete <- enquete_list do
          # 更新処理
          update_data = Ecto.Changeset.change enquete, %{status: 2, start_date: start_date}
          Repo.update update_data
        end
      _ ->
        raise "error!"
    end
  end
end

ChildRearingQuestion.PromotedEnquete.main()
