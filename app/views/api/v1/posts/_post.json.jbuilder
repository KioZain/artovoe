json.extract! post, :id, :title, :post_image, :category_list

json.profile do
  json.name post.user.profile.name if post.user&.profile
end

# json.url post_url(post)
