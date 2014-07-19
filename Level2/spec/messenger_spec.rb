require 'messenger'

describe Messenger do

	xit 'sends a confirmation message' do
		msg = Messenger.new

		msg.twilio_client = double :twilio, account: nil, sms: nil, messages: nil
		expect(takeaway.twilio_client).to receive(:account)
	end

end