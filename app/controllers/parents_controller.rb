class ParentsController < ApplicationController

  get '/parents' do
    if is_logged_in?(session)
      @parents = current_user_parents
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

  get '/parents/:id/edit' do
    @parent = Parent.find(params[:id])
    @house = House.find(@parent.house_id)
    if is_logged_in?(session) && session[:id] == @house.user_id
      @houses = current_user(session).houses
      erb :'parents/edit'
    else
      erb :'error'
    end
  end

  patch '/parents/:id' do
    if params[:name] == ""
      redirect "/parents/#{params[:id]}/edit"
    else
      @parent = Parent.find(params[:id])
      @parent.update(name: params[:name], house_id: params[:house_id])
    end
    redirect "/parents/#{@parent.id}"
  end

  get '/parents/:id' do
    @parent = Parent.find(params[:id])
    @house = House.find(@parent.house_id)
    if is_logged_in?(session) && session[:id] == @house.user_id
      @children = @parent.children
      erb :'parents/show'
    else
      erb :'error'
    end
  end

  delete '/parents/:id/delete' do
    @parent = Parent.find(params[:id])
    @house = House.find(@parent.house_id)
    if is_logged_in?(session) && session[:id] == @house.user_id
      @parent.delete
      redirect to '/parents'
    else
      erb :error
    end
  end

end
