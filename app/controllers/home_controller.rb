class HomeController < ApplicationController
  before_action :set_user, :set_chef
  def index
    @recipes = Recipe.all.order('updated_at DESC')
    @num_rows = @recipes.count - 1
    @i = 0
    if current_user
      @logged_in_user = true
    end
    if current_chef
      @logged_in_chef = true
    end
  end
  private
  def set_user
    if current_user
      @user ||= current_user
    end
  end
  def set_chef
    if current_chef
      @chef ||= current_chef
    end
  end
end
