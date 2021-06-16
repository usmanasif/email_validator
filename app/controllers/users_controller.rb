class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @response = HandleEmailGeneration.new(params).process
  end
end
