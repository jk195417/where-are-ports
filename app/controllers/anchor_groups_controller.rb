class AnchorGroupsController < ApplicationController
  authorize_resource class: false
  before_action :set_anchor_group, only: %i[show edit update destroy]

  def index
    @anchor_groups = AnchorGroup.all.order(elevation: :desc).page(params[:page])
    @anchor_groups_count = AnchorGroup.count
  end

  def show; end

  def new
    @anchor_group = AnchorGroup.new
  end

  def edit; end

  def create
    @anchor_group = AnchorGroup.new(anchor_group_params)
    if @anchor_group.save
      redirect_to @anchor_group, notice: 'Anchor group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @anchor_group.update(anchor_group_params)
      redirect_to @anchor_group, notice: 'Anchor group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @anchor_group.destroy
    redirect_to anchor_groups_url, notice: 'Anchor group was successfully destroyed.'
  end

  private

  def set_anchor_group
    @anchor_group = AnchorGroup.find(params[:id])
    @anchors_page = @anchor_group.anchors.page(params[:anchor_page]).per(10)
    @infos_page = @anchor_group.infos.order(votes_count: :desc).page(params[:info_page]).per(10)
  end

  def anchor_group_params
    params.require(:anchor_group).permit(:latitude, :longitude, :elevation, :what_3_words, :old_name)
  end
end
