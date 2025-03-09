class Api::V1::ProfilesController < ApplicationController
before_action :set_profile, only: [ :show ]

  def show
  end

  private

def set_profile
  @profile = Profile.includes(
    user: [
      :posts,
      :collections,
      { posts: :tags }
    ]
  ).find(params[:id])
end

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar, :contact)
  end
end
