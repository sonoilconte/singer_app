class WelcomeController < ApplicationController
  def index
    @random = Random.new.rand(100)
    @roles = ['Musetta', 'Susanna', 'Fiordiligi']
  end
end
