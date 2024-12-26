class Api::V1::ProfilesController < ApplicationController
  def index
    @profiles = Profile
      .joins(user: [ :posts, :collections ])
      .group("profiles.id")
      .having("COUNT(posts.id) >= 5 AND COUNT(collections.id) >= 2")
  end

  def show
  end
end
