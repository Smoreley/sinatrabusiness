class User < ActiveRecord::Base

	# def self.authenticate_unsafely(user_name, password)
 #    	where("user_name = '#{user_name}' AND password = '#{password}'").first
 #  	end

	# def self.authenticate_safely(user_name, password)
	# 	where("user_name = ? AND password = ?", user_name, password).first
	# end
	
	# def self.authenticate_safely_simply(user_name, password)
	# 	where(user_name: user_name, password: password).first
	# end
	has_one :billing
	has_many :orders
end


class Billing < ActiveRecord::Base

	# def self.authenticate_unsafely(user_name, password)
 #    	where("user_name = '#{user_name}' AND password = '#{password}'").first
 #  	end

	# def self.authenticate_safely(user_name, password)
	# 	where("user_name = ? AND password = ?", user_name, password).first
	# end
	
	# def self.authenticate_safely_simply(user_name, password)
	# 	where(user_name: user_name, password: password).first
	# end
	belongs_to :user

	  # validates_uniqueness_of :user_id, conditions: -> { where.not(status: 'archived') }

end

class Order < ActiveRecord::Base

	belongs_to :user

end
