class PaintingsController < ApplicationController

    get '/paintings' do
        if logged_in?
          @paintings = Painting.all
          erb :'paintings/paintings'
        else
          redirect to '/login'
        end 
      end

    get "/paintings/new" do
      erb :'paintings/new'
    end  


    get "/paintings/:id/edit" do
        @painting = Painting.find(params[:id])
        erb :'paintings/edit'
    end


    post "/paintings" do
        Painting.create(params)
        redirect "/paintings"
     end
   


end 