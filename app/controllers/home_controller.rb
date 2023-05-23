class HomeController < ApplicationController
  # before_action :authenticate_user!
  def index
    if user_signed_in?
      if current_user.buyer?
        redirect_to tours_path
      else
        redirect_to new_visitingpoint_path
      end
    end
  end
end
