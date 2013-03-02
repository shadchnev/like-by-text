require 'sinatra'
require 'twilio-ruby'

# Routes
get '/' do
  erb :index
end

post '/send_text' do
    account_sid = 'ACf8ed5fa862f3467651428344584118bb'
    auth_token = '2fb33294869d005883105b812b035d17'    
    client = Twilio::REST::Client.new(account_sid, auth_token)
    name = params["name"]
    if params["like"] == "yes"
      message = " likes"
    else
      message = " doesn't like"
    end    
    text = name + message + " your photo!"
    client.account.sms.messages.create(:from => '+441290211061', :to => '+447923374199', :body => text)
    redirect "/"
end
