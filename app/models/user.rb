class User < ActiveRecord::Base
  has_one :stash
  has_many :photos
  has_one :stash

  def self.from_omniauth(auth)
    u = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    u.name = auth.info.name
    u.oauth_token = auth.credentials.token
    u.oauth_expires_at = Time.at(auth.credentials.expires_at)
    u.save!
    Stash.create(user_id: u.id)
    u
  end

  private
  def provider_params
    auth_params = auth.require(:provider)
  end

end
