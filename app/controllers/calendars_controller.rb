class CalendarsController < ApplicationController




  def show
  		@temp2 = Calendar.where(:day_of_event => params[:whatday], :user_id => current_user) 
  		@day =  params[:whatday]	
  end





  private
  def calendar_params
    params.require(:calendar).permit(:event, :time)
  end
end
