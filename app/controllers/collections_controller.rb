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
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = current_user.collections.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to collection_path(@collection), notice: "Collection was successfully created." }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collection_path(@collection), notice: "Collection was successfully updated." }
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
      format.html { redirect_to collections_path, status: :see_other, notice: "Collection was successfully destroyed." }
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
