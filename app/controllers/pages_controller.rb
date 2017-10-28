class PagesController < ApplicationController

  before_action :authenticate_user!

  def home; end

  def following; end

  def follower; end

end
