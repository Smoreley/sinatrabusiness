require 'sinatra'

# get '/' do 
     
#     erb :contact;
    
# end

get '/:name' do

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

