class AlertService
    def call
			url = 'https://www.loja3m.com.br/api/checkout/pub/orderforms/simulation'
			response = RestClient.post(url, payload.to_json, {content_type: :json, accept: :json})
			parsed = JSON.parse(response)
			if parsed["items"].present?
				item = parsed["items"].first
				alert if item["availability"] == "available"
			end
    end

		private

		def payload
			{
				"items": [{
					"id": "432",
					"quantity": 10,
					"seller": 1
				}]
			}
		end

		def alert
			url = 'https://api.telegram.org/bot1888083119:AAF89ss1lLadMCnxo59FztjJt6uBhlifFS4/sendMessage?chat_id=@alertaaura&text=A%20m%C3%A1scara%20da%20Gucci%20voltou%20ao%20estoque!%20https%3A%2F%2Fwww.loja3m.com.br%2Fcheckout%2Fcart%2Fadd%2F%3Fsku%3D432%26qty%3D10%26seller%3D1'
			RestClient.get(url)
		end
end