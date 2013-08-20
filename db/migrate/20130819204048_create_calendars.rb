class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :event
      t.datetime :time
      t.string :description

      t.timestamps
    end 
  end
end
