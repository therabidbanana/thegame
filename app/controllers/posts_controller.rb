class PostsController < ApplicationController
  def index
    @posts = Post.all(:limit => 10, :order => :created_at.desc)
  end
  def new
    if authorize! :create, :post
      @post = Post.new
      render :new
    end
  end
  def show
    if authorize! :view, :post
      if @post = Post.find(params[:id])
        render :show
      else
        not_found!
      end
    end
  end
  def create
    if authorize! :create, :post
      attaches = params.delete( :attachments )
      @post = Post.new(params[:post].merge(:player => current_player))
      attaches.each do |p|
        @post.attachments.build(p)
      end unless attaches.blank?
      @post.save

      redirect_to player_path(current_user.player)
    end
  end

end
