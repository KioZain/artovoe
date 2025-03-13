# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :authenticate_user!

  def toggle
    @likable = find_likable
    Rails.logger.info "-------LIKABLE: #{@likable.inspect}-------"
    Rails.logger.info "-------CURRENT USER: #{current_user.inspect}-------"
    @like = @likable.likes.find_by(user: current_user)
    Rails.logger.info "-------LIKE FOUND: #{@like.inspect}-------"


    if @like
      @like.destroy!
      Rails.logger.info "-------LIKE DESTROYED-------"
    else
      @likable.likes.create!(user: current_user)
      Rails.logger.info "-------LIKE CREATED-------"
    end

    @likable.update_likes_count

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def find_likable
    params[:type].constantize.find(params[:id])
  rescue NameError
    raise ActiveRecord::RecordNotFound, "Invalid type: #{params[:type]}"
  end
end
