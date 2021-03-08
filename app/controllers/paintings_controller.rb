class PaintingsController < ApplicationController

    get '/paintings' do
        if logged_in?
          @paintings = Painting.all
          erb :'paintings/index'
        else
          redirect to '/login'
        end 
      end

    post "/paintings/new" do  #create post
      Painting.create(params)
      redirect "/user_homepage"
     end

    get "/new" do  #create get
      erb :'paintings/new'
    end  


    get "/paintings/:id/edit" do #update get
        @painting = Painting.find(params[:id])
        erb :'paintings/edit'
    end

    post "/paintings/:id" do #update post
        @painting = Painting.find(params[:id])
        @painting.update(params.select{|p| p=="name" || p=="year" || p=="artist_id"})
        redirect "/paintings/#{@painting.id}"
      end


      get "/paintings/:id" do #read get
        @painting = Painting.find(params[:id])
        erb :'paintings/show'
      end



   


end 