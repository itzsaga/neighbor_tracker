class HousesController < ApplicationController

  get '/houses' do
    if is_logged_in?(session)
      @houses = current_user(session).houses
      erb :'houses/houses'
    else
      erb :'error'
    end
  end

  get '/houses/new' do
    if is_logged_in?(session)
      erb :'houses/new'
    else
      erb :'error'
    end
  end

  post '/houses' do
    if is_logged_in?(session)
      house = House.new(address: params[:address], user_id: session[:id])
      if house.save
        redirect 'houses'
      else
        redirect 'houses/new'
      end
    else
      erb :'error'
    end
  end

  get '/houses/:id/edit' do
    set_house
    if logged_in_auth
      erb :'houses/edit'
    elsif logged_in_not_auth
      erb :'not_auth'
    else
      erb :'error'
    end
  end

  get '/houses/:id' do
    set_house
    if logged_in_auth
      @parents = @house.parents
      @children = @house.children.uniq
      erb :'houses/show'
    elsif logged_in_not_auth
      erb :'not_auth'
    else
      erb :'error'
    end
  end

  patch '/houses/:id' do
    if params[:address] == ""
      redirect "/houses/#{params[:id]}/edit"
    else
      set_house
      @house.update(address: params[:address])
    end
    redirect "/houses/#{@house.id}"
  end

  delete '/houses/:id/delete' do
    set_house
    if logged_in_auth
      @house.delete
      redirect to '/houses'
    else
      erb :error
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

end
