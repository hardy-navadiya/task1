class ClientsController < ApplicationController
	def new
		@client = Client.new
	end

	def create
	    @client = Client.new(client_params)
	    if @client.save
	    	flash[:success] = "Client created Successfully!!"
	      redirect_to @client
	    else
	      render 'new'
	    end
  	end


	def show
		@client = Client.find(params[:id])
	end

	private
	def client_params
		params.require(:client).permit(:name, :email)
	end
end
