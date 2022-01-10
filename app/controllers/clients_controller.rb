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
		@clients = Client.all
		
    respond_to do |format|
      if @client.save
      	@clients = Client.all
        format.html { redirect_to clients_url, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
        format.js
      end
    end
	end

	def edit
    @client = Client.find(params[:id])
  end

  def update
  	@client = Client.find(params[:id])
    respond_to do |format|
      if @client.update(client_params)
        @clients = Client.all
        format.html { redirect_to clients_url, notice: "Client was successfully updated." }
        format.js
      else
        format.html { render :edit}
        format.js
      end
    end
  end

  def destroy
  	@client = Client.find_by(params[:id])
  	@client.destroy
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
