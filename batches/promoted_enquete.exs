defmodule ChildRearingQuestion.PromotedEnquete do
  alias ChildRearingQuestion.Repo
  alias ChildRearingQuestion.Enquete

  def main() do
    enquete = Repo.get! Enquete, 1
    raise enquete.id
  end
end

ChildRearingQuestion.PromotedEnquete.main()
