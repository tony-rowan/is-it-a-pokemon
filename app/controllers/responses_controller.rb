class ResponsesController < ApplicationController
  def create
    correct = [true, false].sample
    redirect_to answer_path(correct: correct)
  end
end
