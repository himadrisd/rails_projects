require 'net/http'
require 'uri'
require 'json'
require 'creditcard'


class PosTerminal
	@@error = ""
	@@ex = 10
	@@response = nil
	@@url_authorize = "http://localhost:4567/posauthorize"
	@@url_settelment = "http://localhost:4567/settelment"
#	@@url_authorize = "http://192.168.0.2:4567/posauthorize"
#	@@url_settelment = "http://192.168.0.2:4567/settelment"

	def self.default_pos
			@@dummy_gateway_credential = {
			"login": "CrossoverUSA",
			"password": "secret"
		}
	end

	def self.default_expos
			@@dummy_gateway_credential = {
			"logni": "CrossoverUSA",
			"password": "secret"
		}
	end

	def self.authorize_default(amount)
		#send post request to dummy payment gateway

		header = {'Content-Type': 'application/json'}

		server_url = URI.parse(@@url_authorize)
		params_login = self.default_pos
		if @@ex == 1
			params_login = self.default_expos
			@@ex = 10
		else  
			@@ex -= 1
		end

		# Create the HTTP objects
		http = Net::HTTP.new(server_url.host, server_url.port)
		request = Net::HTTP::Post.new(server_url.request_uri, header)
		request.body = params_login.to_json

		# Send the request
		begin
			@error = ""
			response = http.request(request)

			if response.code == "201" || response.code == "200" 
				server_url = URI.parse(@@url_settelment) 
				params_settelment = Creditcard.default_card

				# Create the HTTP objects
				http = Net::HTTP.new(server_url.host, server_url.port)
				request = Net::HTTP::Post.new(server_url.request_uri, header)
				request.body = params_settelment.to_json

				# Send the request
				response = http.request(request)
			end

			@@response = response

		rescue => e
			@@error = e.message
			#redirect_to "/process_payment_failed", notice: e.message
		
		end

	end

	def authorize_card(amount, credit_card)

	end

	def self.get_poserror
		@@error
	end
end