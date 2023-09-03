# frozen_string_literal: true

BulletmarkRepairerTestApp::Application.routes.draw do
  resources :plays, only: [:index]
end

class CreateAllTables < ActiveRecord::Migration[7.0]
  def self.up
    create_table 'plays' do |t|
      t.string :name
    end

    create_table 'companies' do |t|
      t.string :name
    end

    create_table 'actors' do |t|
      t.references :company
      t.string :name
    end

    create_table 'play_actors' do |t|
      t.references :play
      t.references :actor
    end
  end
end

CreateAllTables.up

class PlaysController < ActionController::Base
  def index; end
end

class Play < ActiveRecord::Base
  has_many :play_actors
  has_many :actors, through: :play_actors
end

class PlayActor < ActiveRecord::Base
  belongs_to :play
  belongs_to :actor
end

class Actor < ActiveRecord::Base
  belongs_to :company
  has_many :play_actors
  has_many :plays, through: :play_actors
end

class Company < ActiveRecord::Base
  has_many :actors
end