class HotelsController < ApplicationController
  # before_action :authenticate_user!

  def new
    if current_user&.admin?
      @hotel = Hotel.new
    else
      flash[:alert] = "Please Login To Continue"
      redirect_to new_user_session_path
    end
  end
  
  def index
    @hotels = Hotel.all
  end
  
  def update
    @hotel = Hotel.find(params[:id])
  
    if @hotel.update(hotel_params)
      redirect_to hotels_path
    else
      render 'edit'
    end
  end
  def edit
    @hotel =Hotel.find(params[:id])
  end

  def create
    if current_user.admin?
    #  byebug
      @hotel = Hotel.create(hotel_params)
      @hotel.save
      if @hotel.save
        flash[:notice] = 'Hotel Was Successfully Created.'
        redirect_to hotels_path      
      else  
        flash[:notice] = 'Error Occured Please Try Again.'
        render 'new'
      end
    else
      flash[:alert] = "You Dont Have Rights To Do Do This Action"
      render 'new' 
    end
  end
  def show
    @hotel =Hotel.find(params[:id])
  end
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
   
    redirect_to hotels_path
  end
  
  private
  def hotel_params
    params.require(:hotel).permit(:name,:category,:price_per_night,:location,:contact_no)
  end
end
