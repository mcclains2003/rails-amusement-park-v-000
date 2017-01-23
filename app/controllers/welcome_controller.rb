class WelcomeController < ApplicationController

  def home
    return @user = User.find_by(id: params(:id)) if params[:id]
  end

end
