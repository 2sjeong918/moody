class Point < ActiveRecord::Base
    mount_uploader :cardimg, S3Uploader
    belongs_to :post
end
