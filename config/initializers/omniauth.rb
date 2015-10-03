OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '1633633020219850', 'b6a060a55c41571095331bf16e46e209',
               :scope => 'email,user_birthday,publish_actions', :display => 'popup'
end
