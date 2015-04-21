class IdeasController < ApplicationController
before_action :authenticate_user!, except: :index

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to root_path, notice: "Idea created"
    else
      flash[:alert] = "Problem"
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to root_path, notice: "Idea Updated"
    else
      flash[:alert] = "Problem"
      render :new
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.user == current_user
      @idea.destroy
      redirect_to root_path, notice: "Idea Deleted"
    else
      flash[:alert] = "You cannot delete an idea thats not yours"
      redirect_to root_path
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

end
