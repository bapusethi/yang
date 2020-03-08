class MessagesAPI < Grape::API  
  namespace :messages do
    desc 'Creates a reply.'
    params do
      requires :conversation_id, type: Integer, desc: 'Conversation ID.'
      requires :body, type: String, desc: 'Message body.'
    end

    post do
      current_contact.reply_to_conversation(
        Mailboxer::Conversation.find(params[:conversation_id]), params[:body]
      )
    end
  end
end