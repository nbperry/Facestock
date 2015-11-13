class WelcomeController < ApplicationController
    def index
        @current_user = current_user

        #Get Feed Data
        #If user is not null then post the message
        if current_user != nil
            #if the form message is empty then dont make a post


            accessToken = current_user.token
            @facebook = Koala::Facebook::API.new(accessToken)


            @results = @facebook.get_connections('me', 'feed')

        end

        #if a user is logged in get their userstocks
        if @current_user != nil
            @topStocks = User.find(@current_user).userstocks.order("quantity desc").limit(5)
        else
            @topStocks = nil
        end

        #get all chat messages
        @messages = Message.all

    end


end
