# frozen_string_literal: true

BulletmarkRepairerTestApp::Application.routes.draw do
  resources :multiple_lines, only: [:index]
  resource :single_line, only: [:show]
  resources :previous_lines, only: [:index]
  resources :multiple_actions, only: %i[index show]
  resources :n_plus_one_in_views, only: [:index]
  resources :n_plus_one_in_views_multiple_methods, only: %i[index show]
end
