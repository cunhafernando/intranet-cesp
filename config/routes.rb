Rails.application.routes.draw do
  resources :censo_setors
    
  get 'painel/index'
  get 'painel/show'
  get 'welcome/index'
  get 'welcome/bi_hegv'
  root "welcome#index"

  #resources :painel do
  #end

  resources :censo_setors do
    collection do
      get 'remove_all'
    end
  end
  resources :amount_of_upa_services do
    collection do
      get 'remove_all'
    end
  end
  resources :computed_tomographies do
    collection do
      get 'remove_all'
    end
  end
  resources :production_by_specialties do
    collection do
      get 'remove_all'
    end
  end
  resources :consolidados do
    collection do
      get 'remove_all'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'import_production_by_specialties' => "production_by_specialties#import_production_by_specialties"
  post 'import_computed_tomographies' => "computed_tomographies#import_computed_tomographies"
  post 'import_amount_of_upa_services' => "amount_of_upa_services#import_amount_of_upa_services"
  post 'import_consolidados' => "consolidados#import_consolidados"
  post 'import_censo_setors' => "censo_setors#import_censo_setors"

  # Defines the root path route ("/")
  # root "articles#index"
end
