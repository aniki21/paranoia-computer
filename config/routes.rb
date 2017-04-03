Rails.application.routes.draw do
  resources :missions, only: [:show]

  resources :voice_lines, only: [:index,:create,:update,:destroy] do
    collection do
      match 'say', to: 'voice_lines#say', via: [:get,:post]
      match 'preview', to: 'voice_lines#preview', via: [:get,:post]
    end
  end

  root "missions#show"
end
