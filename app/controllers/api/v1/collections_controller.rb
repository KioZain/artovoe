class Api::V1::CollectionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
   @collections = Collection.includes(:posts).all
  end

  def show
    @collection = Collection.includes(:posts).find(params[:id])
  end

    def create
      user = User.find_by_jti(decrypt_payload[0][":jti"])
      @posts = user.posts
      @collection = user.collections.new(collection_params)

    if @collection.save
      render json: @collection, status: :created
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def update
    @collection = Collection.find(params[:id])
    user = User.find_by_jti(decrypt_payload[0][":jti"])
    @posts = user.posts

    unless @collection.user == user
      return render json: { error: "Unauthorized" }, status: :unauthorized
    end

    if @collection.update(collection_params)
      render json: @collection, status: :ok
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    user = User.find_by_jti(decrypt_payload[0][":jti"])

    unless @collection.user == user
      return render json: { error: "Unauthorized" }, status: :unauthorized
    end

    @collection.destroy
    head :no_content
  end

  private

  def collection_params
    params.require(:collection).permit(
      :title, :body, :category_list, :tag_list,
      post_ids: []
    )
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
