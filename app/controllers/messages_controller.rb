class MessagesController < ApplicationController
  before_action :authenticate_user!
  # 自分のメッセージであるかどうかをチェックする
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @messages = Message.includes(:user).order(id: :desc)
  end

  def new
    @message = Message.new
  end

  def create
    message = current_user.messages.create!(message_params)
    redirect_to message
  end

  def edit
  end

  def update
    @message.update!(message_params)
    redirect_to messages_path
  end

  def destroy
    @message.destroy!
    redirect_to messages_path
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def correct_user
    @message = current_user.messages.find_by(id: params[:id])
    redirect_to messages_path if @message.nil?
  end
end
