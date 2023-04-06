class MixesController < ApplicationController
  before_action :set_mix, only: %i[show edit update destroy]

  def index
    @mixes = Mix.all
  end

  def new
    @mixes = Mix.new
  end

  def create
    @mixes = Mix.new(toilet_params)
    @mixes.user = current_user
    if @mixes.save
      # redirect_to toilet_path(@mixes)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @mixes = Mix.find(params[:id])
    @mixes.destroy
    # redirect_to toilets_path, status: :see_other
  end

  def myMix
    @mixes = Mix.where(user_id: current_user.id)
  end

  private

  def set_mix
    @mixes = Mix.find(params[:id])
  end

  def mix_params
    params.require(:mix).permit(:name, :video_id)
  end

end
