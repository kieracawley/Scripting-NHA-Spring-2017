require 'sendgrid-ruby'
require 'byebug'
require 'dotenv'
Dotenv.load
include SendGrid

from = Email.new(email: 'timcook@apple.com')
to = Email.new(email: 'hi@nanohackers.org')
subject = 'I am Tim Cook'
content = Content.new(type: 'text/plain', value: 'I am Tim Cook. I am the best.')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
