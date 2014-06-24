Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET, {:provider_ignores_state => true}
end