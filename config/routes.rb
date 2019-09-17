Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :survivors do
        resource :location, only: [:show, :update]
        resources :flags, only: [:create]
      end
      get '/reports' => 'survivors#reports'
    end
  end
end
