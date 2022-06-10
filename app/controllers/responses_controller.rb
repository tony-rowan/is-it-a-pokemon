class ResponsesController < ApplicationController
  def create
    redirect_to answer_path(correct: correct)
  end

  private

  def correct
    (Pokemon.exists?(name: question.name) && question_response == "Yes") ||
      (!Pokemon.exists?(name: question.name) && question_response == "No")
  end

  def question_response
    params.dig(:response, :response)
  end

  def question
    Question.find(params.dig(:response, :question))
  end
end
