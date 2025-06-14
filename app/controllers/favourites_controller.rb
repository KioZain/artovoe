# app/controllers/favourites_controller.rb
class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def toggle
    @favouriteable = find_favouriteable
    @favourite = @favouriteable.favourites.find_by(user: current_user)

    if @favourite
      @favourite.destroy!
    else
      @favouriteable.favourites.create!(user: current_user)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def find_favouriteable
    params[:type].constantize.find(params[:id])
  rescue NameError
    raise ActiveRecord::RecordNotFound, "Invalid type: #{params[:type]}"
  end
end
