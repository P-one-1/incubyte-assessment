Rails.application.routes.draw do
  post '/calculators/add', to: 'calculators#add'
  get "up" => "rails/health#show", as: :rails_health_check
end
