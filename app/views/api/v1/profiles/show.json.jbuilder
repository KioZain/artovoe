# json.partial! "api/v1/profiles/profile", profile: @profile
json.extract! @profile, :name, :bio, :avatar, :contact
json.author_tags @profile.user.top_tag_names

json.set! :posts do
  json.array! @profile.user.posts do |post|
    json.partial! "api/v1/posts/post", post: post
  end
end

json.collections do
  json.array! @profile.user.collections, partial: "api/v1/collections/collection", as: :collection
end
