json.extract! comment, :id, :postid, :userid, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
