module FakeSms
	# We use this in order to test an API properly
	Message = Struct.new(:number, :message) # Struct allows you to mimic a database so to speak, can assign methods and behavior to it
	@messages = []

	def self.send_sms(number:, message:)
		@messages << Message.new(number, message)
	end

	def self.messages
		@messages
	end
end