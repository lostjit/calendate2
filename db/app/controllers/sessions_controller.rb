class SessionsController < ApplicationController

	def login
		user = User.find_by(email_address: params[:user][:email_address]).try(:authenticate, params[:user][:password])
	  	if user == false || user.nil?
	  		redirect_to users_path, :flash => { :error => 'Email and password don\'t match.' }
	  	else
	  		sign_in user
	  		@time1 = Time.new
			redirect_to user_show_path(user, @time1)
	  	end
	end

	def destroy
		sign_out
  		redirect_to users_path
	end

end