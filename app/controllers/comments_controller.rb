class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :comment_owner, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new(idea_id:   params[:idea_id],
                           parent_id: params[:parent_id])

    respond_to do |format|
      format.html
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Created a new comment!"
    end
    render 'create'
  end

  #def show
  #end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to idea_path(@comment.idea),
                  flash: { success: "Comment updated." }
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:idea_id, :parent_id, :text)
  end

  def comment_owner
    @comment = Comment.where(id: params[:id]).first
    redirect_to idea_path(@comment.idea) unless @comment.user == current_user
  end
end
