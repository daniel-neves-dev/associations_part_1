class ApplicationController < ActionController::Base
  before_action :authenticate_account!, except: %i[show index home]
end
