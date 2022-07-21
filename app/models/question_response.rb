class QuestionResponse < ApplicationRecord
  belongs_to :question

  def correct?
    correct
  end

  def self.stats
    {
      total: {
        all: count,
        correct: where(correct: true).count,
        wrong: where(correct: false).count
      },
      real: {
        all: where(answer: true).count,
        correct: where(answer: true, correct: true).count,
        wrong: where(answer: true, correct: false).count
      },
      fake: {
        all: where(answer: false).count,
        correct: where(answer: false, correct: true).count,
        wrong: where(answer: false, correct: false).count
      }
    }
  end
end
