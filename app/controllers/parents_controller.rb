class ParentsController < ApplicationController

  get '/parents' do
    if is_logged_in?(session)
      @parents = []
      current_user(session).houses.each do |house|
        Parent.where(house_id: house.id).each do |parent|
          @parents << parent
        end
      end
      erb :'parents/parents'
    else
      erb :'error'
    end
  end

  get '/parents/new' do
    if is_logged_in?(session)
      @houses = current_user(session).houses
      erb :'parents/new'
    else
      erb :'error'
    end
  end

  post '/parents' do
    if is_logged_in?(session)
      parent = Parent.new(params)
      if parent.save
        redirect 'parents'
      else
        redirect 'parents/new'
      end
    else
      erb :'error'
    end
  end

  get '/parents/:id' do
    @parent = Parent.find(params[:id])
    @house = House.find(@parent.house_id)
    if is_logged_in?(session) && session[:id] == House.find(@parent.house_id).user_id
      @children = @parent.children
      erb :'parents/show'
    else
      erb :'error'
    end
  end

end
