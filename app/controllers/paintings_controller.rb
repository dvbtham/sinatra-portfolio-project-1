class PaintingsController < ApplicationController

    get '/paintings' do
        if logged_in?
          @paintings = Painting.all
          erb :'paintings/paintings'
        else
          redirect to '/login'
        end 
      end
   


end 