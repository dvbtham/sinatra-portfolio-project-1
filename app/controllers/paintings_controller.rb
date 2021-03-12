class PaintingsController < ApplicationController

  get '/index' do #read get
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

  # post '/index' do #read post
  #   if logged_in?
  #     if params[:name] == ""
  #       redirect to "/new"
  #     else
  #       @painting = current_user.paintings.build(name: params[:name])
  #       if @painting.save
  #         redirect to "/painting/#{@painting.id}"
  #       else
  #         redirect to "/new"
  #       end
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end


  #   get '/paintings/:id' do
  #     if logged_in?
  #       @painting = Painting.find_by_id(params[:id])
  #       erb :'paintings/show'
  #     else
  #       redirect to '/index'
  #     end
  #   end



    get "/paintings/:id/edit" do #update get
      if logged_in?
          @painting = Painting.find_by_id(params[:id])
        if @painting && @painting.user == current_user
          erb :'paintings/edit'
        else
        redirect to '/user_homepage'
        end
      else
        redirect to '/login'
      end
    end


    patch '/paintings/:id/edit' do
      if logged_in?
        if params[:name] == ""
          redirect to "/paintings/#{params[:id]}/edit"
        else
          @painting = Painting.find_by_id(params[:id])
          @user = User.find_by_id(session[:user_id])
          if @painting && @painting.user == current_user
            if @painting.update(content: params[:content])
              redirect to "/paintings/#{@painting.id}"
            else
              redirect to "/paintings/#{@painting.id}/edit"
            end
          else
            redirect to '/index'
          end
        end
      else
        redirect to '/login'
      end
    end

    # post "/paintings/:id" do #update post
    #     @painting = Painting.find(params[:id])
    #     @painting.update(params.select{|p| p=="name" || p=="year" || p=="artist_id"})
    #     redirect "/paintings/#{@painting.id}"
    #   end



      # get '/user_homepage' do
      #   if logged_in?
      #     erb :'users/user_homepage'
      #   else
      #     redirect '/index'
      #   end
      # end 
      




   


end 