Rails.application.routes.draw do
  root 'main_page#show'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}

  delete :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests
  end
end
