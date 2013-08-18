


	class User < ActiveRecord::Base

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name,						:presence					=> true,
  																	:length						=> { :maximum => 50 }
  validates :last_name,							:presence					=> true,
  																	:length						=> { :maximum => 50 }
  validates :email_address,									:presence					=> true,
  																	:format 			    => { :with => email_regex, message: "Incorrect email format."},
           													:uniqueness 			=> { :case_sensitive => false }
  validates :password,              :length			      => { :within => 6..40 }

  before_save { self.email = email.downcase }
  has_secure_password
  
end

