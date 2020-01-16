Rails.application.routes.draw do
  root 'main_page#show'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}

  delete :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist, on: :member
  end

  resources :badges, only: %i[index]

  namespace :admin do
    resources :badges, shallow: true
    resources :gists, only: %i[index]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
