require_relative 'config/environment'
configure do
    enable :sessions
    set :session_secret, "secret"
end

class App < Sinatra::Base
    get '/' do
        erb :index
    end

    # post '/checkout' do
    #     params.to_s
    # end
    post '/checkout' do
        @session = session
        session[:item] = params[:item]
        params[:item] + @session
    end
end