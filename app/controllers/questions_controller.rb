class QuestionsController < ApplicationController
  include Score

  def show
    @question = Question.order("RANDOM()").first
  end
end
