class OperationsController < ApplicationController

	def new	
		if Current.user
			render :new
		else
			redirect_to sign_in_path, notice: "Please Sign in so you can use our service"
		end
	end

	def search
		#require "shodanz"
		api = Shodanz.client.new(key: "$SHODAN_API_KEY")

		ip = params[:IP]
		if verif_ip(ip)
			@host = api.host(ip)
			#blingbling = host['data']
			#render plain: "#{params[:IP]}"
			render :search
		else
			flash[:alert] = "Please enter a valid ip address!"
			render :new
		end
	end

	private def verif_ip(str)
		require 'resolv'	 	 
		case str
		when Resolv::IPv4::Regex
			return true
		else
			return false
		end
	end
end
