class ConversationsController < ApplicationController
  def index
    @conversations = current_contact.mailbox.conversations
  end

  def show
    @conversation = current_contact.mailbox.conversations.find(params[:id])
  end

  def create
    current_contact.send_message(Contact.find(params[:contact_id]), params[:body], params[:subject])
  end

  def new
    @contact_id = params[:contact_id]
  end
end
