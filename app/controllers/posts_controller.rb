# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[edit update destroy]


  def index
    @posts = Post.all
  end

  def by_tag
    @posts = Post.tagged_with(params[:tag])
    render :index
  end

  # GET /posts/new
  def new
    @post.displays.build
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Пост успешно создан" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts/1/edit
  def edit
    @posts = Post.all # Если это нужно для какого-то функционала
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Пост успешно обновлён" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Пост успешно удалён" }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title, :body, :author, :post_image, :price, :city, :amount, :category_list, :year,
      displays_attributes: [ :id, :name, :year, :display_type, :city, :_destroy ],
      tag_list: []
    )
  end
end
