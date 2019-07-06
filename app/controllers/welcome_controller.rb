class WelcomeController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(21)
    @all_ranks = Post.create_all_ranks
  end
end
