Rails.application.routes.draw do
  get root to: "homes#index"

  namespace :api, format: 'json' do
    resources :memos, only: [:index, :create]
  end

end
