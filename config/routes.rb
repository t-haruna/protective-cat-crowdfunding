Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  resources :projects do
    collection do
      get 'mypage'
      get 'draft_display'
      get 'posting_project'
      get 'done_project'
    end
    resources :drafts, only: [:new, :create ]
  end
  
end
