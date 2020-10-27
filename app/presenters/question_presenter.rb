class QuestionPresenter
  attr_reader :question

  def initialize(question)
    @question = question
  end

  def present
    {
      id: question.id,
      body: question.body
    }
  end
end
