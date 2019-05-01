class PostsController < ApplicationController

  # before_action :logout_move_index,  except: :index
  
  def index
    @posts = Post.all.order('created_at DESC')
    # .page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :action => :index
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image)
  end

  def logout_move_index
    # edirect_to action: :index unless user_signed_in?
  end
end
