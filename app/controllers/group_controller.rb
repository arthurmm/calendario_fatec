class GroupController < ApplicationController
  def index
    @groups = Group.find(:all)
  end

  def new
      @group = Group.new
  end

  def create
  end

end

