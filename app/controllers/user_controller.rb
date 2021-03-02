class UsersController < ApplicationController


  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/'
    end
  end

post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to '/standin'
    else 
        redirect to '/signup'
    end 
end 



end 




