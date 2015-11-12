class User < ActiveRecord::Base
  has_many :messages
  has_many :userstocks

  def self.omniauth(auth)

    # If the user already exists update their token info
    if(self.where(provider: auth.provider, uid: auth.uid).exists?)
      updatedUser = User.find_by(provider: auth.provider, uid: auth.uid)

      updatedUser.token = auth.credentials.token
      updatedUser.save

      return updatedUser

    # Otherwise create an entry for this user
    else

      self.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.token = auth.credentials.token
        user.save
      end
    end

  end

  def getProfile(auth)
    accessToken = auth['token']

    facebook = Koala::Facebook::API.new(accessToken)
    userProfile = facebook.get_object("me?fields=name,picture");
  end

  def getFeed(auth)
    accessToken = auth['token']
    facebook = Koala::Facebook::API.new(accessToken)
    feed = facebook.get_connections("me", "feed")

    return feed;
  end
end
