class AnchorsController < ApplicationController
  before_action :set_anchor, only: %i[show edit update destroy]

  def index
    @anchors = Anchor.all.order(:id).page(params[:page])
    @anchors_count = Anchor.count
  end

  def show; end

  def new
    @anchor = Anchor.new
  end

  def edit; end

  def create
    @anchor = Anchor.new(anchor_params)
    if @anchor.save
      redirect_to @anchor, notice: 'Anchor was successfully created.'
    else
      flash[:warning] = 'create failed'
      render :new
    end
  end

  def update
    if @anchor.update(anchor_params)
      redirect_to @anchor, notice: 'Anchor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @anchor.destroy
    redirect_to anchors_url, notice: 'Anchor was successfully destroyed.'
  end

  private

  def set_anchor
    @anchor = Anchor.find(params[:id])
  end

  def anchor_params
    params.require(:anchor).permit(:latitude, :longitude, :elevation, :what_3_words)
  end
end
