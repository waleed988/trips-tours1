class ToursController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def new
    if current_user&.buyer?
      @tour = Tour.new
    else
      flash[:alert] = "Please Login To Continue"
      redirect_to new_user_session_path
    end
  end
  def create
    if current_user.buyer?
      persons = params[:tour][:no_of_persons].to_i
      $days = params[:tour][:end_date].to_date - params[:tour][:start_date].to_date
      @hotel = Hotel.find(params[:tour][:hotel_id].to_i)
      @transport= Transport.find(params[:tour][:transport_id].to_i)

      hotel_bill = @hotel.price_per_night.to_i * $days * persons
      transport_bill = @transport.price.to_i * $days 
      @net_bill = hotel_bill + transport_bill
       @tour = Tour.create(tour_params)
       redirect_to checkouts_create_path(name: current_user.name,price: @tour.bill)
       @tour.save
       if @tour.save
         flash[:notice] = 'Booking  Successfully Created.'
        #  redirect_to root_url      
       else  
         flash[:notice] = 'Error Occured Please Try Again.'
         render 'new'
       end
     else
       flash[:alert] = "You Dont Have Rights To Do Do This Action"
       render 'new' 
     end
   end
   private
   def tour_params
    params.require(:tour).permit(:name,:no_of_days,:no_of_persons,:hotel_id,:visitingpoint_id,:transport_id, :start_date,:end_date,:phone).merge(bill: @net_bill ,user_id: current_user.id)
   end

end
