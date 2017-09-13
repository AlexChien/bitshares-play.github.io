class HomeController < ApplicationController
  layout "static";

  def index
    @post = Post.published.ordered.first
  end
end
