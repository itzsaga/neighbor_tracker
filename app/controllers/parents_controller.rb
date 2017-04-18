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

end
