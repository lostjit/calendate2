class AddEventTimeToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :event_time, :time
    change_column :calendars, :time, :date
    rename_column :calendars, :time, :day_of_event
  end
end
