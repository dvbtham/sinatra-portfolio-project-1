class PaintingsController < ApplicationController

    get '/paintings' do
        if logged_in?
          @paintings = Painting.all
          erb :'paintings/paintings'
        else
          redirect to '/login'
        end 
      end

    post "/paintings" do
      Painting.create(params)
      redirect "/paintings"
     end

    get "/paintings/new" do
      erb :'paintings/new'
    end  


    get "/paintings/:id/edit" do
        @painting = Painting.find(params[:id])
        erb :'paintings/edit'
    end

    post "/paintings/:id" do
        @painting = Painting.find(params[:id])
        @painting.update(params.select{|p| p=="name" || p=="year" || p=="artist_id"})
        redirect "/paintings/#{@painting.id}"
      end



   


end 