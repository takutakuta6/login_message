class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.includes(:user)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @messages = Message.find(params[:id])
  end
end
