OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '193417264333535', '9360a97adc92579836e0f5cf516d801b', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
