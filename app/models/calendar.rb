class Calendar < ActiveRecord::Base
	belongs_to :user

	validates :event, :presence => true





end