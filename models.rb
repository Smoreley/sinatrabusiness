class User < ActiveRecord::Base

	def self.authenticate_unsafely(user_name, password)
    	where("user_name = '#{user_name}' AND password = '#{password}'").first
  	end

	def self.authenticate_safely(user_name, password)
		where("user_name = ? AND password = ?", user_name, password).first
	end
	
	def self.authenticate_safely_simply(user_name, password)
		where(user_name: user_name, password: password).first
	end
end