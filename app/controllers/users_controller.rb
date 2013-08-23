class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.new
  end

  def create
 
    @user = User.new(user_params)


    if @user.save
      sign_in @user
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







      redirect_to user_show_path(@user, @realdate)
    else
      @show = "register"
      render action: "index"
    end
  end

  def show
    if(!signed_in?)
      deny_access
    
    end

    @dateis = (params[:monthis].to_date)
    @user = Calendar.new

     @year = @dateis.year
    @month = @dateis.month


      if @month < 10
        @minidate = @year.to_s + "-0" + @month.to_s + "%"
      else
        @minidate = @year.to_s + "-" + @month.to_s + "%"
      end

    #@howmanyevents = User.find(current_user).calendars.where("day_of_event LIKE ?", @minidate)
    @howmanyevents = Calendar.where("cast(day_of_event as text) LIKE ?", @minidate).where(user_id: current_user)
    @howmanyevents_length = @howmanyevents.length


    @day = 1

    case @year
      when 2013
        @a = 2
      when 2014
        @a = 3
      when 2015
        @a = 4
      when 2016
       @a = 6
      when 2017
        @a = 7
      when 2018
        @a = 8
      when 2019
        @a = 9
      when 2020
        @a = 4
      when 2021
        @a = 5
      when 2022
        @a = 6
      end

      case @month
        when 1
          @b = 6
          @numofdays = 31
          @monthname = "January"
        when 2
          @b = 2
          @numofdays = 28
          @monthname = "February"
        when 3
          @b = 2
          @numofdays = 31
          @monthname = "March"
        when 4
          @b = 5
          @numofdays = 30
          @monthname = "April"
        when 5
          @b = 0
          @numofdays = 31
          @monthname = "May"
        when 6
          @b = 3
          @numofdays = 30
          @monthname = "June"
        when 7
          @b = 5
          @numofdays = 31
          @monthname = "July"
        when 8
          @b = 1
          @numofdays = 31
          @monthname = "August"
        when 9
          @b = 4
          @numofdays = 30
          @monthname = "September"
        when 10
          @b = 6
          @numofdays = 31
          @monthname = "October"
        when 11
          @b = 2
          @numofdays = 30
          @monthname = "November"
        when 12
          @b = 4
          @numofdays = 31
          @monthname = "December"
       end


       #variable to tell what day the 1st lands on for any given month/year (that we've listed)
    @answer = (@day + @a + @b) % 7

    
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end
end
