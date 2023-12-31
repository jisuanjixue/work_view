# == Route Map
#

Rails.application.routes.draw do
  # get 'words/create'
  # get 'words/destroy'
  # get 'word_books/index'
  devise_for :users,  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
 
  # resources :users do

  # end
  # get 'user_profile/:id', to: 'users#show', controller: 'users/profile'

  resources :word_books do
    resources :words do
      patch 'mastered', on: :member      
      patch 'unmastered', on: :member
    end
  end 

  resources :notes do
    resources :note_types, expect: %i[show index] do
      resources :note_items, except: %i[index show ]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'home/index'
  # Defines the root path route ("/")
  root to: 'word_books#index'
end
