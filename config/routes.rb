Rails.application.routes.draw do
  get '/calculators/add', to: 'calculators#add'
  get "up" => "rails/health#show", as: :rails_health_check
end
