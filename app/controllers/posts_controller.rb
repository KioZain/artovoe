# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[edit update destroy]


def index
    @sort = params[:sort] || "created_at"
    @direction = params[:direction] || "desc"

    permitted_params = params.permit(materials: [], moods: [], genres: [], themes: [], sort: {}, direction: {}, page: {})

    base_posts = Post.all

    %i[materials moods genres themes].each do |context|
      if permitted_params[context].present?
        if permitted_params[context].all? { |tag| valid_tag?(context, tag) }
          base_posts = base_posts.tagged_with(permitted_params[context], on: context, any: false)
        else
        end
      end
    end

    # sort
    base_posts = if valid_sort? && valid_direction?
      base_posts.reorder(@sort => @direction)
    else
      base_posts.reorder(created_at: :desc)
    end

    @posts = base_posts.page(params[:page]).per(24)
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

    puts "--------------Material list-----------------: #{@post.material_list.inspect}"
    puts "--------------Genre list-----------------: #{@post.genre_list.inspect}"
    puts "--------------Theme list-----------------: #{@post.theme_list.inspect}"
    puts "--------------Mood list-----------------: #{@post.mood_list.inspect}"

    respond_to do |format|
      if @post.save
        redirect_url = if request.xhr? || params[:format] == "json"
          post_displays_new_path(@post, saved: 1)
        else
          post_path(@post)
        end

        format.html { redirect_to redirect_url, notice: "Пост успешно создан" }
        format.json { render json: { id: @post.id, redirect_url: redirect_url }, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @next_post = @post.cyclic_next_post
    @previous_post = @post.cyclic_previous_post
    @has_next = @post.next_post.present?
    @has_previous = @post.previous_post.present?
  end

  # GET /posts/1/edit
  def edit
    @posts = Post.all
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

  def valid_tag?(context, tag)
    case context
    when :materials then MATERIAL_TAGS.include?(tag)
    when :moods     then MOOD_TAGS.include?(tag)
    when :genres    then GENRE_TAGS.include?(tag)
    when :themes    then THEME_TAGS.include?(tag)
    else
      false
    end
  end

  def valid_sort?
    %w[likes_count created_at year].include?(@sort)
  end

  def valid_direction?
    %w[asc desc].include?(@direction)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title, :body, :author, :post_image, :price, :city, :amount, :category_list, :year,
      displays_attributes: [ :id, :name, :year, :display_type, :city, :_destroy ],
      tag_list: [],
      material_list: [],
      mood_list: [],
      genre_list: [],
      theme_list: []
    )
  end
end
