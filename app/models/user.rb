class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        # :confirmable,
        :lockable, :timeoutable,
        :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2, :twitter]

  has_many :reviews
  has_many :movies, through: :reviews


  # def self.create_from_provider_data(provider_data)
  #   # where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
  #   #   user.email = provider_data.info.email
  #   #   user.password = Devise.friendly_token[0, 20]
  #   #   user.skip_confirmation!
  #   # end
  # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   user.email = auth.info.email
  #   user.password = Devise.friendly_token[0,20]
  #   user.name = auth.info.name   # assuming the user model has a name
  #   user.image = auth.info.image # assuming the user model has an image
  #   # If you are using confirmable and the provider(s) you use validate emails,
  #   # uncomment the line below to skip the confirmation emails.
  #   # user.skip_confirmation!
  #   end
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name, user.last_name = auth.info.name.split(" ")   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end
end
