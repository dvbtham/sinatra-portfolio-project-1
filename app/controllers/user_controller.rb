class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/user_homepage'
  end


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
        redirect to '/user_homepage'
    else 
        redirect to '/'
    end 
end 

get '/user_homepage' do
  if logged_in?
    erb :'users/user_homepage'
  else
    redirect '/'
  end
end 



end 





