module Score
  extend ActiveSupport::Concern

  included do
    helper_method :score
  end

  def score
    return nil unless session[:score]

    "#{session[:score]["correct"]}/#{session[:score]["total"]}"
  end

  def record_response(correct:)
    session[:score] = { "correct" => 0, "total" => 0 } unless session[:score]

    session[:score]["correct"] += 1 if correct
    session[:score]["total"] += 1
  end
end
