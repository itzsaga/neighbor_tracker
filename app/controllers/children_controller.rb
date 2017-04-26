class ChildrenController < ApplicationController

  get '/children' do
    if is_logged_in?(session)
      @children = current_user_parents.collect {|parent| parent.children}.flatten.uniq
      erb :'children/children'
    else
      erb :'error'
    end
  end

  get '/children/new' do
    if is_logged_in?(session)
      @houses = current_user(session).houses
      @parents = current_user_parents
      erb :'children/new'
    else
      erb :'error'
    end
  end

  post '/children' do
    if is_logged_in?(session)
      child = Child.new(params)
      if child.save
        redirect 'children'
      else
        redirect 'child/new'
      end
    else
      erb :'error'
    end
  end

  get '/children/:id/edit' do
    set_child
    set_house
    if logged_in_auth
      @parents = current_user_parents
      erb :'children/edit'
    elsif logged_in_not_auth
      erb :'not_auth'
    else
      erb :'error'
    end
  end

  patch '/children/:id' do
    if params[:name] == ""
      redirect "/children/#{params[:id]}/edit"
    else
      set_child
      @child.update(name: params[:name], age: params[:age], parent_ids: params[:parent_ids])
    end
    redirect "/children/#{@child.id}"
  end

  get '/children/:id' do
    set_child
    set_house
    if logged_in_auth
      @parents = @child.parents
      erb :'children/show'
    elsif logged_in_not_auth
      erb :'not_auth'
    else
      erb :'error'
    end
  end

  delete '/children/:id/delete' do
    set_child
    set_house
    if logged_in_auth
      @child.delete
      redirect to '/children'
    else
      erb :error
    end
  end

  private

  def set_house
    @house = House.find(@child.parents.first.house_id)
  end

  def set_child
    @child = Child.find(params[:id])
  end
end
