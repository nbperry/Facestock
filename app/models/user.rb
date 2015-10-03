class User < ActiveRecord::Base
  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.save
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
