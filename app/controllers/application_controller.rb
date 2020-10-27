class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing do |error|
    render(status: 400, json: error)
  end
end
