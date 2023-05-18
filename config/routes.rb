require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  get "/values", to: "signal_values#index"

  get "/latest_value", to: "signal_values#latest_value"


  resources :realtimes, only: %i[index show]

  # TelegramWebhooksController.action_path '/telegram/bot'


  # TelegramBotController.draw do
  #   telegram_webhooks TelegramBotController
  # end
end
