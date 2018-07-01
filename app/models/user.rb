class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :myimg, ImageUploader
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  
end
