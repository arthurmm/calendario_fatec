class GroupController < ApplicationController
  def index
    @groups = Group.find(:all)
    return @groups
  end

  def create
      @new_group = new Group()
      return @new_group
  end

end

