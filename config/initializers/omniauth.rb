OmniAuth.config.logger = Rails.logger

  if Rails.env.development?

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '1634892103427275', '9c7ea987cbbdeaa85012d75d3623feed',
               :scope => 'email,user_birthday,publish_actions,user_posts', :display => 'popup'
    end

  else

    Rails.application.config.middleware.use OmniAuth::Builder do
          provider :facebook, '1633633020219850', 'b6a060a55c41571095331bf16e46e209',
                   :scope => 'email,user_birthday,publish_actions,user_posts', :display => 'popup'
    end

  end

