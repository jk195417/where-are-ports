class PagesController < ApplicationController
  def index
    @anchor_groups = AnchorGroup.all
  end

  def map
    @anchors = AnchorGroup.all
  end

  def solutions; end
end
