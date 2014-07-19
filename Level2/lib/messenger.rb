class Messenger
	
	ACC_SID = 'ACb15bc85c5dff0bb1fed26ba4d78ec644'
	AUTH_TOKEN = 'd0751776e643f84fbd0cf06ee4a553c4'

	def initialize
		@twilio_client = Twilio::REST::Client.new ACC_SID, AUTH_TOKEN
	end

	def send_text_message
		time = Time.new
		@twilio_client.account.sms.messages.create(
      :from => "+441539234074",
      :to => "+447736047481",
      :body => "Thank you! Your order was placed and will be delivered before #{time + (60 * 60)}."
    )
	end

end