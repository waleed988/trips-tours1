class WebhooksController < ApplicationController
  skip_before_action :authenticate_user! , :raise => false
  skip_before_action :verify_authenticity_token

  def index
    redirect_to root_url
  end
  def create
  end

end
