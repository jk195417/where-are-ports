class PagesController < ApplicationController
  def index
    @anchor_groups = AnchorGroup.all
  end

  def map
    @anchor_groups= AnchorGroup.all
  end

  def solutions
    @anchor_groups = AnchorGroup.all
  end
end
