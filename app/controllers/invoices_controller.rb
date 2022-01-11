class InvoicesController < ApplicationController
	def index
		@invoices = Invoice.all
	end
	def new
		@invoice = Invoice.new
		@clients = Client.all
	end

	def create

		@invoice = Invoice.new(invoice_params)
   
		respond_to do |format|
      if @invoice.save
				@client = Client.find(@invoice.client_id)
		
      	@invoices = Invoice.all
        format.html { redirect_to invoice_url(@invoice.client_id), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
        format.js
      end
    end
	end

	def edit
    @invoice = Invoice.find(params[:id])
  	@client = Client.find(@invoice.client_id)
  end

  def update
  	@invoice = Invoice.find(params[:id])
  	@client = Client.find(@invoice.client_id)   
  	
    respond_to do |format|
      if @invoice.update(invoice_params)                                                                                                              
        @invoices = Invoice.all
        format.html { redirect_to invoices_url, notice: "Invoice was successfully updated." }
        format.js
      else
        format.html { render :edit}
        format.js
      end
    end
  end

  def destroy
  	@invoice = Invoice.find_by(params[:id])
  	@invoice.destroy
  	respond_to do |format|
      format.html { redirect_to @invoice, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

	def show
		@invoice = Invoice.new
		@invoices = Invoice.all
		@client = Client.find(params[:id])
    # @client_inv = @client.invoices
	end

	private
	def invoice_params
		params.require(:invoice).permit(:discount, :date, :amount, :client_id, :document)
	end
end
