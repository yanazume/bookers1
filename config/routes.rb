Rails.application.routes.draw do
 get 'books/new'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'books' => 'books#index', as: 'books'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit'=>'books#edit',as: 'edit_book'
  get 'books/:id/show'=>'books#show',as: 'show_book'
  patch 'books/:id' => 'books#update',as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
