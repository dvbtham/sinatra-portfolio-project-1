class UserController < Sinatra::Base


get '/login' do 
  if !logged_in?
    erb :'users/login'
  else 
    redirect to '/standin'
end 

post '/login' do
    if session[:user_id] = user.id
        redirect to '/standin'
    else 
        redirect to '/standin'
    end 
end 



end 





end 