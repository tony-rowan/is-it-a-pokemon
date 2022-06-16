class QuestionResponse < ApplicationRecord
  belongs_to :question

  def correct?
    correct
  end
end
