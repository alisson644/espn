class MessagesController < ApplicationController
  before_action :authenticate_user!, except: %I[index show]
  before_action :set_message, only: %I[show edit update destroy]

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def show; end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to message_path
    else
      render :edit
    end
  end

  def destroy
    @message.destroy

    redirect_to root_path
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description)
  end
end
