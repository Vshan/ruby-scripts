require 'mail'

options = { :address => "smtp.gmail.com",
			:port => 587,
			:user_name => 'secret.santa.ieeenitk',
			:password => 'ieeenitk2016',
			:authentication => 'plain',
			:enable_starttls_auto => true }

Mail.defaults do 
	delivery_method :smtp, options	
end

Mail.deliver do
	to 'salman.badshah19@gmail.com'
	from 'secret.santa.ieeenitk@gmail.com'
	subject 'Test Via Ruby'
	body 'First Mail <br> Greetings!'
end

