json.extract! post, :id, :userid, :title, :postimg, :mood1, :mood2, :mood3, :mood4, :mood5, :created_at, :updated_at
json.url post_url(post, format: :json)
