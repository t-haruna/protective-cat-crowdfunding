Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  resources :projects do
    collection do
      get 'mypage'
      get 'draft_display'
      get 'posting_project'
      get 'done_project'
      get 'confirmation'
    end

    member do
      get 'display'
    end

    resources :drafts, only: [:new, :create]
    resources :executes, only: [:new, :create, :show, :edit, :update]
    resources :billings, only: :create do
      member do
        get 'new_return1'
        get 'new_return2'
        get 'new_return3'
        
      end
      collection do
        post 'create_return1', to: 'billings#create_return1'
      end
    end

  end

  resources :cards, only: [:new, :index, :show] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
