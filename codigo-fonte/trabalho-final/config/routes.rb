Rails.application.routes.draw do
  resources :queries
  resources :specialists
  resources :specialties
  devise_for :users, path: '', path_names: {
                                            sign_in: 'login',
                                            sign_up: 'register',
                                            sign_out: 'logout'
                                          }
  resources :exams
  resources :patients
  get 'escolherPaciente', controller: 'exams', action: 'escolherPaciente'
  get 'escolherPacienteAgenda', controller: 'queries', action: 'escolherPacienteAgenda'
  post 'custom_update', controller: 'exams', action: 'examesPaciente'
  post 'agenda_paciente', controller: 'queries', action: 'visualizarAgendaPaciente'
  post 'custom_att', controller: 'exams', action: 'tt'
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
