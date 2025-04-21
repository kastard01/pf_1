class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]



  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: '投稿しました'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿が更新されました'
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:landscape_name, :caption, :image)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
