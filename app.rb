require 'sinatra'
require 'sinatra/activerecord'
require 'json'
# require "sendgrid-ruby"

enable :sessions

configure :development do
  set :database, 'sqlite3:db/database.db'
end 
require './models'

# --- Variables ---
@loggedin = false;

# --- GETS ---

# Temp, this should be removed later. Right now used for testing login (with out inputing the data)
# get '/home' do
# 	@user = User.new(email: params["email"],username: params["username"], password: params["password"])
# 	@user.save
# 	session[:id] = @user.id
# 	erb :home
# end

# Global Var go here
before do 
		# Product Info
		@products = [ {name: "Blaster", img: "blaster.jpg", description: "Pew pew pew!"},
			{name: "Saber", img: "lightsaber.jpg", description: "Swosh swosh!"},
			{name: "Hammer", img: "hammer.jpg", description: "Thuuuud......THUUUD!"},
			{name: "Reactor", img: "reactor.jpg", description: "humnznznznznznznnznzn!"},
			{name: "Recorder", img: "talkie.jpg", description: "Sul sul. Zo hungwah Ne chumcha laka fruby nart."},
			{name: "Hook", img: "hook.jpg", description: "puhhh shhshshhsh dadehda cring."},
			{name: "Pickaxe", img: "pickaxe.jpg", description: "Whoops."} ];
end

get '/' do
	erb :'/front'

end

# Main navigation
get '/:name' do

	# If session exists/(signed in) then find user
	if session[:id] != nil
		@user = User.find(session[:id]);
		@loggedin = true;



		case params[:name]
		when "home"
			
			erb :home;
		when "about"
			erb :about;
		when "product"
			erb :product;
		
		when "cart"

			@user = User.find_by_id(session[:id])
			erb :cart;
		when "logout"
			session.clear
			erb :logout;
		else
			erb :Error404;
		end
	else
		@loggedin = false;

		# If not signed in then
		case params[:name]
		when "signup"
			erb :signup;
		when "login"
			erb :login;
		else
			redirect '/';
		end

		# @error = 'you are not signed in'
	end
end

# --- POSTS ---
post '/sign' do
	puts params
	@user = User.new(email: params["email"],username: params["username"], password: params["password"])
	@user.save

	session[:id] = @user.id
	redirect :home;
end

post '/home' do
	#, :provides => :json do
  # I'd use a 201 as the status if actually creating something,
  # 200 while testing.
  # I'd send the JSON back as a confirmation too, hence the
  # :provides => :json
  # @data = JSON.parse params
  # # do something with the data, then…
  # halt 200, data.to_json
  # halt because there's no need to render anything
  # and it's convenient for setting the status too

	@user = User.find_by(email: params["email"], password: params["password"])
	session[:id] = @user.id
	
	
	erb :home
end

post '/checkout' do

	redirect :cart;
end

post '/getdata' do
	@products.to_json
end

post '/add' do
	#@user = User.find_by(email: params["email"], password: params["password"])
	@data = params["data_value"]
	@user = User.find_by_id(session[:id]) 
	@user.update_attributes(products: @data)
end


