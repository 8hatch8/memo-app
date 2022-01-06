class ApplicationController < ActionController::Base
  # CSRF保護を解除
  protect_from_forgery
end
