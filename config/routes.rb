Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'chatbot_statements#chatroom'

  get '/response' => 'user_answers#message'

  constraints Clearance::Constraints::SignedIn.new do
    resources :users, :chatbot_statements, :user_answers
    get '/admin', to: 'clearance/users#dashboard', as: 'admin_route'
    get '/admin/dialogue/new' => 'chatbot_statements#new'
    get '/admin/dialogue/remove' => 'chatbot_statements#remove'
    get '/admin/ending/new' => 'chatbot_statements#ending'
    get '/admin/dialogue/tree' => 'chatbot_statements#view'
  end
end
