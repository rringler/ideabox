class IdeasController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def new
    @idea = Idea.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @idea = Idea.new(post_params)
    @idea.user_id = current_user.id

    if @idea.save
      flash[:success] = "Created a new idea!"
      redirect_to idea_path(@idea)
    else
      render 'new'
    end
  end

  def show
    @idea = Idea.where(id: params[:id]).first
  end

  def edit
  end

  def update
    @idea = Idea.where(id: params[:id]).first

    if @idea.update_attributes(post_params)
      redirect_to idea_path(@idea), flash: { success: "Idea updated." }
    else
      render 'edit'
    end
  end

  def destroy
    @idea = Idea.where(id: params[:id]).first
    @idea.destroy
  end

  private

  def post_params
    params.require(:idea).permit(:description)
  end

  def correct_user
    @idea = Idea.where(id: params[:id]).first
    flash_params = { error: "You cannot edit this post." }
    redirect_to idea_path(@idea), flash: flash_params unless @idea.user == current_user
  end
end
