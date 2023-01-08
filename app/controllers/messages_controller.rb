class MessagesController < ApplicationController
  before_action :set_message, only: %I[show edit update destroy]

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description)
  end
end
