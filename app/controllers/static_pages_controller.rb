class StaticPagesController < ApplicationController
  def welcome
  	render :layout => 'landing'
  end
end
