class Post < ActiveRecord::Base
    mount_uploader :postimg, S3Uploader
    belongs_to :user
    
    has_many :points, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :loves
end
