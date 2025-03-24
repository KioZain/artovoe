class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenicate_guest


  helper_method :all_categories
  def all_categories
    @all_categories ||= ActsAsTaggableOn::Tag
      .joins(:taggings)
      .where(taggings: { context: "categories" })
      .distinct
      .order(:name)
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  def authenicate_guest
    if current_user
      if cookies[:guest_token]
        puts cookies[:guest_token] == current_user.jti
      else
        cookies[:guest_token] = current_user.jti
      end
    end
  end


  protected

  def after_sign_in_path_for(resource)
    if resource.profile.present? && resource.profile.contact.present?
      super
    else
      step1_profiles_path
    end
  end
end
