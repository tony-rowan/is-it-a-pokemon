class AnswersController < ApplicationController
  def show
    @correct = params[:correct] == "true"
  end
end
