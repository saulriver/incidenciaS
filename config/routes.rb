Rails.application.routes.draw do
  

  get 'consults/index'
  
  root to: "welcome#index"
  get 'welcome/index'
  resources :incidentmanagements
  resources :incidents
  resources :criticalities
  resources :applicationoperators
  resources :userareas
  resources :userapplications
  resources :applicationclients
  resources :areas
  resources :applications
  resources :userclients
  resources :clients
  resources :users
  resources :roles
  resources :vistaroles
  resources :vistaclientes
  resources :vistareportes
  resources :vistagestions  
  resources :statisticreports
  resources :statisticmanages
  resources :welcomes

  get '/user/client/:id', to: 'users#user_client_index', as: "user_client_index"
  post '/user/client/:id', to: 'users#user_client_create', as: "user_client_create"
  get '/user/client/delete/:id', to: 'users#user_client_destroy', as: "user_client_destroy"

  get '/user/area/:id', to: 'users#user_area_index', as: "user_area_index"
  post '/user/area/:id', to: 'users#user_area_create', as: "user_area_create"
  get '/user/area/delete/:id', to: 'users#user_area_destroy', as: "user_area_destroy"
  
  get '/user/application/:id', to: 'users#user_application_index', as: "user_application_index"
  post '/user/application/:id', to: 'users#user_application_create', as: "user_application_create"
  get '/user/application/delete/:id', to: 'users#user_application_destroy', as: "user_application_destroy"

  get '/application/operator/:id', to: 'users#application_operator_index', as: "application_operator_index"
  post '/application/operator/:id', to: 'users#application_operator_create', as: "application_operator_create"
  get '/application/operator/delete/:id', to: 'users#application_operator_destroy', as: "application_operator_destroy"

  get '/client/application_client/:id', to: 'clients#client_application_client_index', as: "client_application_client_index"
  post '/client/application_client/:id', to: 'clients#client_application_client_create', as: "client_application_client_create"
  get '/client/application_client/delete/:id', to: 'clients#client_application_client_destroy', as: "client_application_client_destroy"

  get '/gestionar/incident/:id', to: 'incidents#gestionar_incident', as: "gestionar_incident"
  get '/terminar/incident/:id', to: 'incidents#terminar_incident', as: "terminar_incident"
  get '/aprobar/incident/:id', to: 'incidents#aprobar_incident', as: "aprobar_incident"
  get '/rechazar/incident/:id', to: 'incidents#rechazar_incident', as: "rechazar_incident"
  get '/abrir/incident/:id', to: 'incidents#abrir_incident', as: "abrir_incident"
  get '/cerrar/incident/:id', to: 'incidents#cerrar_incident', as: "cerrar_incident"

  get '/incident/admin', to: 'incident_admin#incident_admin', as: "incident_admin"
  get '/assign/incident/:id', to: 'incident_admin#assign_incident', as: "assign_incident"
  post '/incident/admin/list/userArea', to: 'incident_admin#listUserArea', as: "listUserArea"
  post '/incident/admin/assign/operator', to: 'incident_admin#incident_admin_assign_operator', as: "incident_admin_assign_operator"


  devise_for :logins, controllers: {
    sessions: 'logins/sessions',
    registrations: 'logins/registrations'
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
