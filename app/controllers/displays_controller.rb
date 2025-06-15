class DisplaysController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  before_action :authorize_user

  def new
    @display = @post.displays.build
    @show_notice = params[:saved].present?
    @displays = @post.displays.order(created_at: :desc)
    render :new
  end

  def edit
    @post = Post.find(params[:post_id])
    # @display = @post.displays.find(params[:id])
    @display = @post.displays.find_by(id: params[:id]) || @post.displays.build
    @displays = @post.displays.order(created_at: :desc)
  end

  def create
    @display = @post.displays.build(display_params)

    if @display.save
      @displays = @post.displays.order(created_at: :desc)
      Rails.logger.info "========== CREATE SUCCESS: Post ID = #{@post.id}, Display ID = #{@display.id} =============="
      Rails.logger.info "============ Post for form: #{@post.id} ================"
      respond_to do |format|
        format.turbo_stream { 
          render turbo_stream: [
            turbo_stream.append("C_AddedDisplays", partial: "display", locals: { display: @display }),
            turbo_stream.replace("new_display", partial: "form", locals: { post: @post, display: Display.new })
          ]
        }
      end
    else
      @displays = @post.displays.order(created_at: :desc)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @display = @post.displays.find(params[:id])
    if @display.update(display_params)
      redirect_to @post, notice: "Выставка обновлена"
    else
      render :edit
    end
  end

  def destroy
    @display = @post.displays.find(params[:id])
    @display.destroy
    
    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: turbo_stream.remove("display_#{@display.id}")
      }
      format.html { redirect_to @post, notice: "Выставка удалена" }
    end
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def display_params
    params.require(:display).permit(:name, :year, :display_type, :city)
  end

  def authorize_user
    unless current_user == @post.user || current_user.admin?
      redirect_to root_path, alert: "Доступ запрещён"
    end
  end
end
