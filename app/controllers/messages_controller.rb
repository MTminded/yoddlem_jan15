class MessagesController < ApplicationController

  before_filter :verify_user

  def index
    redirect_to inbox_user_messages_path
    @user = current_user
  end

  def new
     @receiver = User.find(params[:user_id])
     @message = Message.new(:receiver => @receiver)
  end

  def create
    @receiver = User.find(params[:user_id])
    @message = current_user.sent_messages.new(params[:message])

    if @message.save
      flash[:notice] = "Message sucessfully sent!"
      redirect_to user_message_path(@receiver, @message)
    else
      render action: "new"
    end

  end

  def show
    @user = current_user
    @message = Message.find(params[:id])

  end

  def inbox
    @user = current_user
    @received_messages = Message.find(:all, 
      conditions: ["(receiver_id = ? and replied_to_message_id IS ?) or (sender_id = ? and replied = ?)",@user.id, nil, @user.id, true],
      order: "updated_at desc")

    @sent_messages = @user.sent_messages.where(replied_to_message_id: nil).order("created_at desc")
  end

  def reply
    @user = current_user
    @replied_to_message = Message.find(params[:id])
    @message = @user.sent_messages.new(params[:message])
    @message.subject = @replied_to_message.subject
    
    if @replied_to_message.sender == @user
      @message.receiver_id = @replied_to_message.receiver_id
    elsif @replied_to_message.receiver == @user
      @message.receiver_id = @replied_to_message.sender_id
    end

    @message.replied_to_message_id = @replied_to_message.id
    if @message.save
      @replied_to_message.replied = true
      @replied_to_message.read = false
      @replied_to_message.save
      flash[:notice] = "Message sucessfully sent!"
      redirect_to user_message_path(@user)
    else
      flash[:notice] = "Something is wrong, please try again!"
      redirect_to inbox_user_messages_path(@user)
    end
  end

  def destroy
    @user = current_user
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to inbox_user_messages_path }
      format.json { head :no_content }
    end
  end
end