class QuestionsController < ApplicationController
  def show
    @question = Question.order("RANDOM()").first
  end
end
