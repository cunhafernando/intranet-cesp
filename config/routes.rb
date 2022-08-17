Rails.application.routes.draw do
  
  get 'welcome/index'
  get 'welcome/show'
  get 'painel/index'
  root "painel#show"

  resources :painel do
  end

  resources :upa_indicadores_ses do
    collection do
      get 'remove_all'
    end
  end

  resources :censo_setors do
    collection do
      get 'remove_all'
    end
  end

  resources :censo_diarios do
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
  post 'import_censo_diarios' => "censo_diarios#import_censo_diarios"
  post 'import_upa_indicadores_ses' => "upa_indicadores_ses#import_upa_indicadores_ses"

  # Defines the root path route ("/")
  # root "articles#index"
end
