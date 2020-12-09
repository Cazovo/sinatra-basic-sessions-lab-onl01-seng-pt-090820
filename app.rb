require_relative 'config/environment'

class App < Sinatra::Base
    
    configure do
        enable :sessions
        set :session_secret, 'flatiron'
    end


    get '/' do 
        erb :index
    end 

    post '/checkout' do 
        session[:item] = params[:item] 
        @session = session
        
        erb :checkout
    end 

end
  get '/set_session' do
    #set session id here
    session[:id] = 1
    if session[:id] == 1
      # "Session ID set. It's currently set to #{session[:id]}."
      redirect '/fetch_session_id'
    else
      "Session ID has not been set!"
    end
  end

  get '/fetch_session_id' do
    "You did it! session[:id] value: #{session[:id]}.\nNow, clear the session in the '/logout' route.\nSee the readme for further instructions.\nThen, navigate to the '/logout' path."
  end

  get '/logout' do
    #clear session hash here
    session.clear
    "Session has now been cleared. session content: #{session.inspect}. Continue on to the '/finish' line!"
  end

  get '/finish' do
    "Hopefully that explains a little more about the concept of sessions.\nThe session is simply a way to store user data on a temporary basis.\nIn any web application, a user ID is typically used as a session ID.\nThis is because an ID attribute of a user is a unique identifier\nthat will always be distinguishable from other user ID attributes."
  end
end