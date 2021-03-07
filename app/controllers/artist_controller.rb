class ArtistController < ApplicationController

    get "/artists" do
        @artists = Artist.all
        erb :'artists/index'
      end
    
    get "/artists/new" do
      erb :'artists/new'
    end
    
    get "/artists/:id/edit" do
        @artist = Artist.find(params[:id])
        erb :'artists/edit'
      end


      post "/artists/:id" do
        @artist = Artist.find(params[:id])
        @artist.update(params.select{|a| a=="name")
        redirect "/artists/#{@artist.id}"
      end

    get "/artists/:id" do
      @artist = Artist.find(params[:id])
      erb :'artists/show'
    end






end 