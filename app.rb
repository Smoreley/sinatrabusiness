require 'sinatra'

# get '/' do 
     
#     erb :contact;
    
# end


require 'sinatra/activerecord'

enable :sessions
configure :development do
  set :database, 'sqlite3:db/database.db'
end 
require './models'



get '/' do


	erb :'/main'

end



# get '/home' do

# @user = User.new(email: params["email"],username: params["username"], password: params["password"])
# @user.save

# session[:id] = @user.id
	
# 	erb :home

# end



post '/sign' do
#   
puts params

@user = User.new(email: params["email"],username: params["username"], password: params["password"])
@user.save

session[:id] = @user.id

redirect '/home'

end

get '/signup' do

	erb :'/s'
end





get '/home' do
  @user = User.find(session[:id])
  erb :'/home'
end

get '/main' do


	erb :'/main'

end

get '/login' do

erb :'/login'

end

post '/home' do


@user = User.find_by(email: params["email"], password: params["password"])
session[:id] = @user.id
erb :home
	end


get '/logout' do
	session.clear
	erb :logout


end











get '/product' do



 
 


if(@user = User.find(session[:id]))

erb :'/home'

@products = [ {name: "Blaster", img: "blaster.jpg", description: "Pew pew pew!"},
		{name: "Saber", img: "lightsaber.jpg", description: "Swosh swosh!"},
		{name: "Hammer", img: "hammer.jpg", description: "Thuuuud......THUUUD!"},
		{name: "Reactor", img: "reactor.jpg", description: "humnznznznznznznnznzn!"},
		{name: "Recorder", img: "talkie.jpg", description: "Sul sul. Zo hungwah Ne chumcha laka fruby nart."},
		{name: "Hook", img: "hook.jpg", description: "puhhh shhshshhsh dadehda cring."},
		{name: "Pickaxe", img: "pickaxe.jpg", description: "Whoops."} ];


erb :product


	
else

	@error = 'you are not signed in'
	erb :main
	



end
end

get '/about' do
	 @user = User.find(session[:id])
  erb :'/home'

	erb :about
end






get ':/name' do

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
	else
		"Nope 404 error!"
	end

end