class Creditcard
	@@cards

	def initialize
		default_card
	end

	def self.default_card
		@@cards = {
			"number": "4111111111111111",
			"month": "10",
			"year": "2019",
			"first_name": "Himadri Sekhar",
			"last_name": "Das",
			"verification_value": "432",
			"amount": "10000"
		}
	end

	def self.check_for_validity_n_save(cardinfo)
		@@cards << cardinfo
	end

end