class Post < ActiveRecord::Base
    mount_uploader :postimg, S3Uploader
end
