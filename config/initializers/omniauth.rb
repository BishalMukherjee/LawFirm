require 'omniauth-google-oauth2'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '4473860777-em84dqrvp8crdcov1d6gue2jt42ari43.apps.googleusercontent.com', 'NlFy9WtiGBl4Jx90Tq-xyIWs'
end