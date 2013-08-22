class SessionsController < ApplicationController


	def login
		user = User.find_by(email_address: params[:user][:email_address]).try(:authenticate, params[:user][:password])
	  	if user == false || user.nil?
	  		redirect_to users_path, :flash => { :error => 'Email and password don\'t match.' }
	  	else
	  		sign_in user
	  		@time1 = Time.new

	  		@year = @time1.year
		    @month = @time1.month
		    @day = @time1.day

		   if @month < 10
       			 @realmonth = "-0" + @month.to_s
     			 else
       			@realmonth = "-" + @month.to_s
      				end

      		if @day < 10
       			 @realday = "-0" + @day.to_s
     			 else
       			@realday = "-" + @day.to_s
      				end

      			@realdate = @year.to_s + @realmonth + @realday

			redirect_to user_show_path(user, @realdate)
	  	end
	end

	def destroy
		sign_out
  		redirect_to users_path
	end

end