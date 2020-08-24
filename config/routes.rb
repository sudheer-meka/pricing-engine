Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/organizations', to: 'group_organizations#organizations'
      get '/locations/:group_organization_id', to: 'group_organizations#locations'
      get '/model_type_prices/:group_organization_id', to: 'group_organizations#model_type_prices'
    end
  end
end
