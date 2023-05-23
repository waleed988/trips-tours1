class VisitingpointsController < ApplicationController
  # before_action :authenticate_user!
  def new
    if current_user&.admin?
      @visitingpoint = Visitingpoint.new
    else
      flash[:alert] = "Please Login To Continue"
      redirect_to new_user_session_path
    end
  end
  
  def index
    @visitingpoints = Visitingpoint.all
  end
  
  def update
    @visitingpoint = Visitingpoint.find(params[:id])
  
    if @visitingpoint.update(visitingpoint_params)
      redirect_to visitingpoints_path
    else
      render 'edit'
    end
  end
  def edit
    @visitingpoint =Visitingpoint.find(params[:id])
  end

  def create
    if current_user.admin?
    #  byebug
      @visitingpoint = Visitingpoint.create(visitingpoint_params)
      @visitingpoint.save
      if @visitingpoint.save
        flash[:notice] = 'Auction was successfully created.'
        redirect_to visitingpoints_path      
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
    @visitingpoint =Visitingpoint.find(params[:id])
  end
  def destroy
    @visitingpoint = Visitingpoint.find(params[:id])
    @visitingpoint.destroy
   
    redirect_to visitingpoints_path
  end
  
  private
  def visitingpoint_params
    params.require(:visitingpoint).permit(:name,:location)
  end
end

