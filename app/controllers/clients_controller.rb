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
    # respond_to do |format|
    #   if @client.save
    #     @client = Client.all
    #     format.html { redirect_to clients_url, notice: "Try was successfully created." }
    #     format.json { render :show, status: :created, location: @client }
    #     format.js
    #   else
    #     format.html { render :client, status: :unprocessable_entity }
    #     format.json { render json: @client.errors, status: :unprocessable_entity }
    #     format.js
    #   end
    # end
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
  	# flash[:danger] = "Client deleted!!"
  	# redirect_to @client

  	respond_to do |format|
      format.html { redirect_to @client, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
      format.js
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
