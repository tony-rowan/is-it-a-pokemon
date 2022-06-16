class DashboardsController < ApplicationController
  def show
    @stats = QuestionResponse.stats
  end
end
