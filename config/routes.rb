Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/users#new"
    get '/admin' => "clearance/users#new"
  end

  constraints Clearance::Constraints::SignedIn.new do
    resources :users, :chatbot_statements, :user_answers
    get '/admin' => "clearance/users#dashboard"
    get '/admin/dialogue/new' => "chatbot_statements#new"
    get '/admin/dialogue/remove' => "chatbot_statements#remove"
    get '/response' => "user_answers#message"
    root to: "chatbot_statements#chatroom", as: :signed_in_root
  end
end
