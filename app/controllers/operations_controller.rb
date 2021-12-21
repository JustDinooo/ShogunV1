class OperationsController < ApplicationController

	def new	
	end

	def search
		#require "shodanz"
		api = Shodanz.client.new(key: "oEghZYqiofqOQqKlRhlmMnhPfFjrmpza")

		results = api.host("#{params[:IP]}")
		blingbling = results['data']
		#render plain: "#{params[:IP]}"
		render plain: "#{blingbling}"
	end
end
