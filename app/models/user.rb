class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :trips

  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  has_many :active_relationships, class_name: "Relationship",
  								  foreign_key: "follower_id",
  								  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship",
  								   foreign_key: "followed_id",
  								   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  ALLOWED_DOMAIN_REGEX = "((?:[-a-z0-9]+\.)+[a-z]{2,})"
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@#{ALLOWED_DOMAIN_REGEX}\z/i }

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
   	  user.email = auth.info.email
   	  user.password = Devise.friendly_token[0,20]
   	  # user.name = auth.info.name   # assuming the user model has a name
   	  #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
