class MessagesController < ApplicationController
  def index
  end

  def create
    # MessagesChannel.broadcast_to('messages', params[:message])
    @message = params[:message]
    Turbo::StreamsChannel.broadcast_action_to 'messages', action: 'append', target: 'messages',
          partial: "messages/message", locals: { message: @message }

  end
end
