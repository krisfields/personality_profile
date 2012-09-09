PersonalityProfile::Application.routes.draw do
  get "user_answers/index"

  get "user_answers/show"

  get "user_answers/new"

  get "user_answers/create"

  get "user_answers/edit"

  get "user_answers/update"

  get "user_answers/destroy"

  get "answers/index"

  get "answers/show"

  get "answers/new"

  get "answers/create"

  get "answers/edit"

  get "answers/update"

  get "answers/destroy"

  get "questions/index"

  get "questions/show"

  get "questions/new"

  get "questions/create"

  get "questions/edit"

  get "questions/update"

  get "questions/destroy"

  get "quizzes/index"

  get "quizzes/show"

  get "quizzes/new"

  get "quizzes/create"

  get "quizzes/edit"

  get "quizzes/update"

  get "quizzes/destroy"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
