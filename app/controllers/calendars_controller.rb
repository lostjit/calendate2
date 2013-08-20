class CalendarsController < ApplicationController




  def show
  		
  		@alluserevents = Calendar.where(:day_of_event => params[:dayis], :user_id => current_user) 
  		@day =  params[:dayis]	
  		@newevent = Calendar.new
  end

  def add

  		@timeis = params[:date][:hour] + ':' + params[:date][:minute] + ":00"
  		@calen_params = {'event' => params[:calendar][:event], 'description' => params[:calendar][:description], 'event_time' => @timeis, 'user_id' => current_user[:id], 'day_of_event' => params[:dayis] }
  		@newevent = Calendar.new(@calen_params)


  		#@temp99 = params
  		if @newevent.save
  			redirect_to calendar_show_path(current_user, params[:dayis])
  		else  			
  			@temp99 = 'fail'
  		end
  		
  end

  def destroy
  	calendar = Calendar.find(params[:id])
  	if calendar.destroy
  		render text: "destroy"
  	else
  		render text: "not destroyed"
  	end
  end




  private
  def calendar_params
    params.require(:calendar).permit(:event, :time)
  end
end
