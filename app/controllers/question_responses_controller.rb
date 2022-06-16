class QuestionResponsesController < ApplicationController
  include Score

  def show
    @response = QuestionResponse.find(params[:id])
  end

  def create
    question_response = QuestionResponse.create!(
      question: question,
      response: user_thought_it_was_a_real_pokemon?,
      answer: it_was_a_real_pokemon?,
      correct: correct?
    )

    record_response(correct: correct?)

    redirect_to(question_response)
  end

  private

  def question
    Question.find(params.dig(:response, :question))
  end

  def correct?
    @correct ||=
      user_correctly_thought_it_was_real? || user_correctly_thought_it_was_fake?
  end

  def user_correctly_thought_it_was_real?
    it_was_a_real_pokemon? && user_thought_it_was_a_real_pokemon?
  end

  def user_correctly_thought_it_was_fake?
    it_was_a_fake_pokemon? && user_thought_it_was_a_fake_pokemon?
  end

  def it_was_a_real_pokemon?
    question.real?
  end

  def it_was_a_fake_pokemon?
    !it_was_a_real_pokemon?
  end

  def user_thought_it_was_a_real_pokemon?
    params.dig(:response, :response) == "Yes"
  end

  def user_thought_it_was_a_fake_pokemon?
    !user_thought_it_was_a_real_pokemon?
  end
end
