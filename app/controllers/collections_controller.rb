class CollectionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_collection, only: %i[edit update destroy]

  def index
    @collections = Collection.all
  end

  def by_tag
    @collections = Collection.tagged_with(params[:tag])
    render :index
  end


  def show
    @collection = Collection.find(params[:id])
  end


  def edit
    @posts = current_user.posts
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
    @posts = current_user.posts.order(:title) # Добавить эту строку
  end

  def create
    @posts = current_user.posts
    @collection = current_user.collections.new(collection_params)
    Rails.logger.info "Creating collection with params: #{collection_params.inspect}"
    respond_to do |format|
      if @collection.save
        format.html { redirect_to collection_path(@collection), notice: "Коллекция успешно создана" }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @posts = current_user.posts
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collection_path(@collection), notice: "Коллекция успешно обновлена" }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @collection.destroy!

    respond_to do |format|
      format.html { redirect_to collections_path, status: :see_other, notice: "Коллекция успешно удалена" }
      format.json { head :no_content }
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :body, :category_list, post_ids: [], tag_list: [])
  end
end
