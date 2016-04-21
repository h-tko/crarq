# 投票中アンケートを開催中に昇格させる
defmodule ChildRearingQuestion.PromotedEnquete do
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.Enquete
  alias ChildRearingQuestion.YamlManager

  def main() do
    # 昇格件数を設定ファイルから取る
    promoted_settings = YamlManager.get("promoted_settings")
    promoted_count = promoted_settings["daily_promoted_count"]

    # 昇格対象のレコードを取得
    enquete_list = Enquete.get_promoted_list(Repo, promoted_count)

    for enquete <- enquete_list do
      # 更新処理
      update_data = Ecto.Changeset.change enquete, status: 2
      Repo.update update_data
    end
  end
end

ChildRearingQuestion.PromotedEnquete.main()
