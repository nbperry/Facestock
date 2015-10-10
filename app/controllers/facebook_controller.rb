class FacebookController < ApplicationController


  def feed
    #accessToken = env['omniauth.auth']['token']
    #facebook = Koala::Facebook::API.new(accessToken)

    #@results = params[:page] ? facebook.get_page(params[:page]) : facebook.get_connections("me", "feed")

    #If user is not null then post the message
    if current_user != nil
      #if the form message is empty then dont make a post


        accessToken = current_user.token
        @facebook = Koala::Facebook::API.new(accessToken)


        @results = @facebook.get_connections('me', 'feed')

    end

    #redirect_to root_url
  end

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
