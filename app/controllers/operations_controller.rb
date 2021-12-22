class OperationsController < ApplicationController

	def new	
	end

	def search
		#require "shodanz"
		api = Shodanz.client.new(key: "oEghZYqiofqOQqKlRhlmMnhPfFjrmpza")

		ip = params[:IP]
		if verif_ip(ip)
			@host = api.host(ip)
			#blingbling = host['data']
			#render plain: "#{params[:IP]}"
			render :search
		else
			render :new, notice: "enter a valid ip address!"
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
