class MessagesController < ApplicationController
  before_action :set_message, only: %I[show edit update destroy]

  def index
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
end
