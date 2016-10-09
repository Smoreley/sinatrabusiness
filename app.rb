require 'sinatra'
require 'sinatra/activerecord'

enable :sessions
configure :development do
  set :database, 'sqlite3:db/database.db'
end 
require './models'

# --- GETS ---

# Temp, this should be removed later. Right now used for testing login (with out inputing the data)
get '/home' do
	@user = User.new(email: params["email"],username: params["username"], password: params["password"])
	@user.save
	session[:id] = @user.id
	erb :home
end

get '/' do
	erb :'/front'
end

# Main navigation
get '/:name' do

	# If session exists/(signed in) then find user
	if session[:id] != nil
		@user = User.find(session[:id]);

		# Product Info
		@products = [ {name: "Blaster", img: "blaster.jpg", description: "Pew pew pew!"},
			{name: "Saber", img: "lightsaber.jpg", description: "Swosh swosh!"},
			{name: "Hammer", img: "hammer.jpg", description: "Thuuuud......THUUUD!"},
			{name: "Reactor", img: "reactor.jpg", description: "humnznznznznznznnznzn!"},
			{name: "Recorder", img: "talkie.jpg", description: "Sul sul. Zo hungwah Ne chumcha laka fruby nart."},
			{name: "Hook", img: "hook.jpg", description: "puhhh shhshshhsh dadehda cring."},
			{name: "Pickaxe", img: "pickaxe.jpg", description: "Whoops."} ];

		case params[:name]
		when "home"
			erb :home;
		when "about"
			erb :about;
		when "product"
			erb :product;
		when "logout"
			session.clear
			erb :logout;
		else
			erb :Error404;
		end
	else
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
	@user = User.find_by(email: params["email"], password: params["password"])
	session[:id] = @user.id
	erb :home
end