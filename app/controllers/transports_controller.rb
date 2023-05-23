class TransportsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user&.admin?
      @transport = Transport.new
    else
      flash[:alert] = "Please Login To Continue"
      redirect_to new_user_session_path
    end
  end
  
  def index
    @transports = Transport.all
  end
  
  def update
    @transport = Transport.find(params[:id])
  
    if @transport.update(transport_params)
      redirect_to transports_path
    else
      render 'edit'
    end
  end
  def edit
    @transport =Transport.find(params[:id])
  end

  def create
    if current_user.admin?
    #  byebug
      @transport = Transport.create(transport_params)
      @transport.save
      if @transport.save
        flash[:notice] = 'Auction was successfully created.'
        redirect_to transports_path      
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
    @transport =Transport.find(params[:id])
  end
  def destroy
    @transport = Transport.find(params[:id])
    @transport.destroy
   
    redirect_to transports_path
  end
  
  private
  def transport_params
    params.require(:transport).permit(:registration_no,:category,:price,:driver_name,:driver_cnic,:driver_phone)
  end
end
