class PagesController < ApplicationController
  before_action { flash.clear }
  skip_before_action :verify_authenticity_token

  def confirm_email;end

  def waiting_for_moderator;end


  def echo
    sleep 2
    render plain: request.body.read
  end
end
