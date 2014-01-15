class YoddlesController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show ]
before_filter :verify_user

  # GET /yoddles
  # GET /yoddles.json
  def index
    @yoddles = Yoddle.order("created_at desc").paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yoddles }
      format.js
    end
  end

  # GET /yoddles/1
  # GET /yoddles/1.json
  def show
    @yoddle = Yoddle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yoddle }
    @commentable = @yoddle
    @comments = @commentable.comments
    @comment = Comment.new
    end
  end

  # GET /yoddles/new
  # GET /yoddles/new.json
  def new
    @yoddle = current_user.yoddles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yoddle }
    end
  end

  # GET /yoddles/1/edit
  def edit
    @yoddle = current_user.yoddles.find(params[:id])
  end

  # POST /yoddles
  # POST /yoddles.json
  def create
    @yoddle = current_user.yoddles.new(params[:yoddle])

    respond_to do |format|
      if @yoddle.save
        format.html { redirect_to @yoddle, notice: 'Yoddle was successfully created.' }
        format.json { render json: @yoddle, status: :created, location: @yoddle }
      else
        format.html { render action: "new" }
        format.json { render json: @yoddle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yoddles/1
  # PUT /yoddles/1.json
  def update
    @yoddle = current_user.yoddles.find(params[:id])

    respond_to do |format|
      if @yoddle.update_attributes(params[:yoddle])
        format.html { redirect_to @yoddle, notice: 'Yoddle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yoddle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yoddles/1
  # DELETE /yoddles/1.json
  def destroy
    @yoddle = current_user.yoddles.find(params[:id])
    @yoddle.destroy

    respond_to do |format|
      format.html { redirect_to yoddles_url }
      format.json { head :no_content }
    end
  end
end