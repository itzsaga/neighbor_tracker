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
    set_parent
    set_house
    if is_logged_in?(session) && session[:id] == @house.user_id
      @houses = current_user(session).houses
      erb :'parents/edit'
    elsif is_logged_in?(session) && session[:id] != @house.user_id
      erb :'not_auth'
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
    set_parent
    set_house
    if logged_in_auth
      @children = @parent.children
      erb :'parents/show'
    elsif logged_in_not_auth
      erb :'not_auth'
    else
      erb :'error'
    end
  end

  delete '/parents/:id/delete' do
    set_parent
    set_house
    if logged_in_auth
      @parent.delete
      redirect to '/parents'
    else
      erb :error
    end
  end

  private

  def logged_in_auth
    is_logged_in?(session) && session[:id] == @house.user_id
  end

  def logged_in_not_auth
    is_logged_in?(session) && session[:id] != @house.user_id
  end

  def set_house
    @house = House.find(@parent.house_id)
  end

  def set_parent
    @parent = Parent.find(params[:id])
  end

end
