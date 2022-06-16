class QuestionResponse < ApplicationRecord
  belongs_to :question

  def correct?
    correct
  end

  def self.stats
    {
      total: {
        all: self.count,
        correct: self.where(correct: true).count,
        wrong: self.where(correct: false).count,
      },
      real: {
        all: self.where(answer: true).count,
        correct: self.where(answer: true, correct: true).count,
        wrong: self.where(answer: true, correct: false).count,
      },
      fake: {
        all: self.where(answer: false).count,
        correct: self.where(answer: false, correct: true).count,
        wrong: self.where(answer: false, correct: false).count,
      }
    }
  end
end
