class ProfilesController < ApplicationController
  before_action :set_profile, only: [
    :step1, :step2, :update_step1, :update_step2,
    :show, :edit, :update, :destroy, :posts, :collections, :displays
  ]

  def step1
    @profile ||= current_user.create_profile!
  end

  def step2
    unless @profile.name.present? && @profile.avatar.present?
      redirect_to step1_profiles_path and return
    end
  end

  def update_step1
    if @profile.update(profile_params_step1)
      redirect_to step2_profiles_path
    else
      render :step1
    end
  end

  def update_step2
    if @profile.update(profile_params_step2)
      session[:profile_setup_complete] = true
      redirect_to profile_path(@profile), notice: "Регистрация завершена!"
    else
      render :step2
    end
  end


  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.includes(user: :posts).all
    initialize_counts
  end

  def by_tag
    @profiles = Profile.tagged_with(params[:tag])
    initialize_counts
    render :index
  end


  # GET /profiles/1 or /profiles/1.json
  def show
    @user = @profile.user
    @posts = @user.posts
    @collections = @user.collections
    @profile = Profile.find(params[:id])
    authorize! :read, @profile
    @posts = @profile.user.posts
    @displays = Display.where(post_id: @posts.pluck(:id))
  end


  def posts
    @user = @profile.user
    @posts = @profile.user.posts
    render :show
  end

  def collections
    @user = @profile.user
    @collections = @profile.user.collections
    render :show
  end

  def displays
    @user = @profile.user
    @posts = @profile.user.posts
    @displays = Display.where(post_id: @posts.pluck(:id))
    render :show
  end


  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /profiles/1 or /profiles/1.json
def destroy
  @profile = Profile.find(params[:id])
  authorize! :destroy, @profile
  user = @profile.user
  user.destroy

  redirect_to profiles_path, notice: "Profile was deleted"
end


  private

    def initialize_counts
      @profile_post_counts = Post.group(:user_id).count
      @profile_collection_counts = Collection.group(:user_id).count
    end


    def profile_params_step1
      params.require(:profile).permit(:name, :bio, :avatar)
    end

    def profile_params_step2
      params.require(:profile).permit(:contact)
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      if current_user
        @profile = current_user.profile || current_user.create_profile!
      else
        @profile = Profile.find_by(id: params[:id]) if params[:id]
      end
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :bio, :avatar, :placed, :contact)
    end
end
