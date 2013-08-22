# OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['604231179621261'], ENV['619c683d5072f4a29f426055259b3196']
end