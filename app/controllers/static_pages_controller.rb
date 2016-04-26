class StaticPagesController < ApplicationController
   def home
    redirect_to users_path if signed_in?
  end

  def about
  end
end
