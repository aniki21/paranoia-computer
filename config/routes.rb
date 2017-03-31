Rails.application.routes.draw do
  resources :missions, only: [:show]

  resources :voice_lines do
    collection do
      get 'say', to: 'voice_lines#say'
    end
  end

  root "missions#show"
end
