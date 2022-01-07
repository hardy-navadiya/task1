module ClientsHelper
	def current_client
		 Client.find_by(params[:id])
	end
end
