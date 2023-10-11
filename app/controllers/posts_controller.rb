class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :destroy] #編集する掲示板を探す
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new #新しい掲示板のフォームを作成する
  end

  def create
    @post = Post.new(post_params) #新しい掲示板のフォームを作成する

    if @post.save
      redirect_to posts_path #掲示板の一覧ページにリダイレクトする
    else
      render :new #新規投稿ページを表示する
    end
  end

  def edit
  end

  def update
    if @post.update(post_params) #掲示板を更新する
      redirect_to posts_path #掲示板の一覧ページにリダイレクトする
    else
      render :edit #編集ページを表示する
    end
  end

  def destroy
    @post.destroy #掲示板を削除する
    redirect_to posts_path #掲示板の一覧ページにリダイレクトする
  end

  private # この下はcontrollerの中でしか呼び出せない

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id]) #編集する掲示板を探す
  end
end
