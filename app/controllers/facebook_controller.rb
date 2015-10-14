class FacebookController < ApplicationController

  #method for sharing a status on facebook
  def status

    #If user is not null then post the message
    if current_user != nil
      #if the form message is empty then dont make a post
      if params[:message] != nil && params[:message] != ""

        accessToken = current_user.token
        facebook = Koala::Facebook::API.new(accessToken)
        message = params[:message]


        facebook.put_wall_post(message)
      end
    end

    redirect_to root_url
  end
end
