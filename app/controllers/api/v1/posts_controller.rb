class Api::V1::PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
  def index
    @posts = Post.all
    # render json: @posts
    # render json: @posts.as_json
  end

  def show
    @post = Post.includes(:displays).find(params[:id])
  end


  def create
    # puts decrypt_payload

    user = User.find_by_jti(decrypt_payload[0][":jti"])
    post = user.posts.new(post_params)

    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end


  # destroy and update
  def destroy
    @post = Post.find(params[:id])
    user = User.find_by_jti(decrypt_payload[0][":jti"])

    unless @post.user == user
      return render json: { error: "Unauthorized" }, status: :unauthorized
    end

    @post.destroy
    head :no_content
  end

    def update
    @post = Post.find(params[:id])
    user = User.find_by_jti(decrypt_payload[0][":jti"])

    unless @post.user == user
      return render json: { error: "Unauthorized" }, status: :unauthorized
    end

    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end
  # ---------------------------

  private

   def post_params
      params.require(:post).permit(
        :title, :body, :author, :post_image,  :price, :city, :amount, :category_list, :year,
        displays_attributes: [ :name, :year, :display_type, :link, :city ], tag_list: [],
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
