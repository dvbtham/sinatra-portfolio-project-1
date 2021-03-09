class PaintingsController < ApplicationController

  get '/index' do
    if logged_in?
      @paintings = Painting.all
      erb :'paintings/index'
    else
      redirect to '/login'
    end 
  end

  get "/new" do  #create get
    erb :'paintings/new'
  end 



    post "/new" do  #create post
      Painting.create(params)
      redirect "/user_homepage"
     end



 #   post '/index' do 
 #     if logged_in?
 #       if params[:content] == ""
 #         redirect to "/paintings/new"
 #       else
 #         @painting = current_user.paintings.build(name: params[:name])
 #         if @painting.save
 #           redirect to "/index/#{@tweet.id}"
 #         else
 #           redirect to "/paintings/new"
 #         end
 #       end
 #     else
 #       redirect to '/login'
 #     end
 #   end  


     
  

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

      get '/user_homepage' do
        if logged_in?
          erb :'users/user_homepage'
        else
          redirect '/index'
        end
      end 
      




   


end 