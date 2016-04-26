class StaticPagesController < ApplicationController
   def home
    redirect_to user_path if signed_in?
  end

  def about
  end
end
