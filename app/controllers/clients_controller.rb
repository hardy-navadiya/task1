class ClientsController < ApplicationController
	def index
		@client = Client.new
		@clients = Client.all
	end

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

	def edit
    @client = Client.find(params[:id])
  end

  def update
  	@client = Client.find(params[:id])
  	if @client.update(client_params)
      flash[:success] = "Client detail edited!!"
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
  	@client = Client.find_by(params[:id])
  	@client.destroy
  	flash[:danger] = "Client deleted!!"
  	redirect_to @client
  end

	def show
		@client = Client.find(params[:id])
	end

	private
	def client_params
		params.require(:client).permit(:name, :email)
	end
end
