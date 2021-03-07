class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
      erb :'users/new_user'
  end


  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/user_homepage'
    end
  end

post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to '/user_homepage'
    else 
        redirect to '/new_user'
    end 
end 

get '/user_homepage' do
  if logged_in?
    erb :'users/user_homepage'
  else
    redirect '/'
  end
end 


get '/signup' do
  if !logged_in?
    erb :'users/new_user'
  else
    redirect to '/paintings'
  end
end 


post '/signup' do
  if params[:username] == "" || params[:email] == "" || params[:password] == ""
    redirect to '/new_user'
  else
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    @user.save
    session[:user_id] = @user.id
    redirect to '/user_homepage'
  end
end



end 





