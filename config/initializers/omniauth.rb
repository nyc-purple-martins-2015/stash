OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['STASH_FB_ID'], ENV['STASH_FB_SECRET'], {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  provider :google_oauth2, ENV['STASH_GG_ID'], ENV['STASH_GG_SECRET'], {:scope => 'email,profile'}
end
