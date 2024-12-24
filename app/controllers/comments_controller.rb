class CommentsController < ApplicationController
  load_and_authorize_resource except: [ :index ]
  before_action :set_post

 def index
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user # привязываем комментарий к текущему пользователю

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to post_path(@post) }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.update("comment_form",
            partial: "comments/form",
            locals: { post: @post })
        }
        format.html { redirect_to post_path(@post) }
      end
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
        format.html { redirect_to post_path(@post) }
      else
        format.turbo_stream { render :edit }
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
      format.html { redirect_to post_path(@post), notice: "Комментарий удален." }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
