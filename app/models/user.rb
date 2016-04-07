class User < ActiveRecord::Base
  has_many :bars
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
end
