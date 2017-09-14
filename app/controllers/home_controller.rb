class HomeController < ApplicationController
  layout "static";

  def index
    @post = Post.published.ordered.first
  end

  def locale_redirect
    redirect_to "/?locale=#{params[:locale]}"
  end
end
