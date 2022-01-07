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
    if @invoice.save
    	flash[:success] = "Invoice created Successfully!!"
      redirect_to @invoice
		else
		  render 'new'
		end
	end

	def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
  	@invoice = Invoice.find(params[:id])
  	if @invoice.update(invoice_params)
      flash[:success] = "invoice detail edited!!"
      redirect_to @invoice
    else
      render 'edit'
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
	end

	private
	def invoice_params
		params.require(:invoice).permit(:discount, :date, :amount, :client_id, :document)
	end
end
