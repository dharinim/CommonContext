class HomesController < ApplicationController
  before_action :set_auth
  
  def index
    NotificationMailer.welcome_email().deliver
  end

  def finish_registration
    render "_show"
  end
end
