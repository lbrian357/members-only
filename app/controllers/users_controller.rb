class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      p "User successfully created"
    else
      p "Error creating user"
    end

  end
end
