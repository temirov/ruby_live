class ApplicationController < ActionController::Base
  include ActionController::Live
  include Concerns::Sseable
  protect_from_forgery
end
