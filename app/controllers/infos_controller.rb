class InfosController < ApplicationController
  authorize_resource class: false
  rescue_from CanCan::AccessDenied do |e|
    flash[:warning] = 'Please login first'
    redirect_to new_user_session_url
  end
  before_action :set_info, only: %i[show edit update destroy vote cancel_vote]

  def index
    @infos = Info.all
  end

  def show; end

  def new
    @info = Info.new
    @anchor_group = AnchorGroup.find(params[:anchor_group])
    @info.anchor_group = @anchor_group
    @info.user = current_user
  end

  def edit; end

  def create
    @info = Info.new(info_params)
    @anchor_group = AnchorGroup.find info_params[:anchor_group_id]
    if @info.save
      redirect_to @info.anchor_group, notice: 'Info was successfully created.'
    else
      render :new
    end
  end

  def update
    if @info.update(info_params)
      redirect_to @info.anchor_group, notice: 'Info was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @info.destroy
    redirect_to infos_url, notice: 'Info was successfully destroyed.'
  end

  def vote
    @info.votes.build(user: current_user)
    if @info.save
      flash[:notice] = 'You was successfully voted this info.'
    else
      flash[:danger] = 'Some things wrong.'
    end
    redirect_to @info.anchor_group
  end

  def cancel_vote
    @vote = Vote.find_by! info: @info, user: current_user
    if @vote.destroy
      flash[:notice] = 'You was successfully canceled your vote to this info.'
    else
      flash[:danger] = 'Some things wrong.'
    end
    redirect_to @info.anchor_group
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:name, :port_type, :fishable, :hardwares, :desc, :img_url, :user_id, :anchor_group_id)
  end
end
