Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chatbot_statements
  resources :user_answers
  get '/admin' => "chatbot_statements#new"
  get '/response' => "user_answers#message"

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/users#new"
    get '/admin' => "clearance/users#new"
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "chatbot_statements#chatroom", as: :signed_in_root
    resources :users
  end
end
