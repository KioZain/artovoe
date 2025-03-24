
json.extract! collection, :id, :title, :body, :tag_list

json.profile do
  json.name collection.user.profile.name if collection.user&.profile
end

json.posts_images collection.posts.map do |post|
  json.id post.id
  json.url post.post_image? ? post.post_image.url : nil
end.compact
