class PagesController < ApplicationController
  def show
  end


  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))


  def home

  end

  def blog
  end

  def about
  end

end
