class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show ]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :load_commentable
  before_filter :verify_user
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end
def update
     @comment = Comment.find(params[:id])
     @comment.update_attributes(params[:comment])
     response_to do |format|
         format.html do
               if @comment.errors.present?
                     render :edit
               else
                     redirect_to polymorphic_path(@commentable), :notice => "Yay updated!"
                     # or
                     #redirect_to polymorphic_path([@commentable, @comment]), :notice => "Yay i can update and see further down the path!"
               end
         end
     end
end

  def destroy
      @comment = Comment.find(params[:id])
      @commentable = @comment.commentable
        if @comment.destroy
          respond_to do |format|
            format.html { redirect_to @commentable, notice: "Comment deleted."  }
          end
        end
     end
     

private

  
  # alternative option:
   def load_commentable
     klass = [Yoddle].detect { |c| params["#{c.name.underscore}_id"] }
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
   end

    private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end