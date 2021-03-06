class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(21).order('updated_at DESC').search(params[:search])
    @posts = @posts.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "「#{@post.title}」の記事を投稿しました。"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "「#{@post.title}」の記事を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tag_list)
  end
end
