class CreateUsersTable < ActiveRecord::Migration
	def up
	create_table :users do |t|
		t.string :email
		t.string :username
		t.string :password
		t.string :products

		t.datetime :created_at
		t.datetime :updated_at
		end
	

	create_table :billings do |t|
		t.integer :user_id
		t.string :street
		t.string :state
		t.string :city
		t.string :zipcode
	end


	create_table :orders do |t|
		t.integer :user_id
		t.string  :total
		t.datetime :created_at
	end





	end

	def down
		drop_table :users
		drop_table :billings
		drop_table :orders
	end
end

# class AddColumnBilling < ActiveRecord::Migration
	
# 	def change
# 	add_column :billings, :user_id, :integer

# end
# end