PersonalityProfile::Application.routes.draw do
 
 resources :quizzes
 resources :questions
 resources :answers
 resources :user_answers
 
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
