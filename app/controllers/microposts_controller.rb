class MicropostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show ]
  before_filter :correct_user,   only: :destroy
  before_filter :verify_user
  
  def index
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Yoddlepost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost = current_user.microposts.find(params[:id])
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }  
  end
 end

   private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end

