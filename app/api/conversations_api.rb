class ConversationsAPI < Grape::API  
  namespace :conversations do
    get :index do
      { conversations: current_contact.mailbox.conversations }
    end

    desc 'Return a conversation.'
    params do
      requires :id, type: Integer, desc: 'Conversation ID.'
    end

    route_param :id do
      get do
        current_contact.mailbox.conversations.find(params[:id])
      end
    end

    desc 'Creates a conversation.'
    params do
      requires :subject, type: String, desc: 'Conversation ID.'
      requires :body, type: String, desc: 'Conversation ID.'
      requires :contact_id, type: Integer, desc: 'Conversation ID.'
    end

    post do
      current_contact.send_message(
        Contact.find(params[:contact_id]),
        params[:body],
        params[:subject]
      )
    end
  end
end
