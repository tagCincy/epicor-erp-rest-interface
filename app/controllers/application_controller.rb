class ApplicationController < ActionController::Base
  include SoapHelpers

  protect_from_forgery
end
