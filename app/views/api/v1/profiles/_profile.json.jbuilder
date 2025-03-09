json.extract! @profile, :name, :bio, :avatar, :contact


json.profile do
  if collection.user&.profile.present?
    json.extract! collection.user.profile, :name
  else
    json.null!
  end
end
