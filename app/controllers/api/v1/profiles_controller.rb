class Api::V1::ProfilesController < ApplicationController
before_action :set_profile, only: [ :show ]

  def show
  end

  def create
    user = User.find_by_jti(decrypt_payload[:jti])
    @profile = user.build_profile(profile_params)

    if user.profile.present?
      return render json: { error: "Profile exists" }, status: :unprocessable_entity
    end
    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by_jti(decrypt_payload[:jti])
    @profile = user.profile

    if @profile.update(profile_params)
      render json: @profile, status: :ok
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end


  private

  def set_profile
    @profile = Profile.includes(
      user: [
        :posts,
        :collections
        # { posts: :tags }
      ]
    ).find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar, :contact)
  end

  def encrypt_payload
    payload = @user.as_json(only: [ :email, :jti ])
    token = JWT.encode(payload, Rails.application.credentials.devise_jwt_secret_key!, "HS256")
  end

  def decrypt_payload
    jwt = request.headers["Authorization"]
    token = JWT.decode(jwt, Rails.application.credentials.devise_jwt_secret_key!, true, { algorithm: "HS256" })
  end
end
