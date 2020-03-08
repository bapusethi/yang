class API < Grape::API
  prefix 'api'
  format :json
  
  helpers do
    def warden
      env['warden']
    end

    def current_contact
      @current_contact ||= warden.user
    end
  end

  mount ConversationsAPI
  mount MessagesAPI
end