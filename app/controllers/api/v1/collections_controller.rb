class Api::V1::CollectionsController < ApplicationController
  def index
   @collections = Collection.includes(:posts).all
  end

  def show
    @collection = Collection.includes(:posts).find(params[:id])
  end
end
