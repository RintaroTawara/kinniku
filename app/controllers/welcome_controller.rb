class WelcomeController < ApplicationController
  def home
    @posts = Post.all
  end
end
