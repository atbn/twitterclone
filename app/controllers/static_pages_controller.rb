class StaticPagesController < ApplicationController

  def index
    if user_signed_in?
      redirect_to user.show
    end
  end
end