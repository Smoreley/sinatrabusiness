require 'sinatra'

# get '/' do 
     
#     erb :contact;
    
# end

get '/:name' do

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