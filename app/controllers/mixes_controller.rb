class MixesController < ApplicationController
  before_action :set_mix, only: %i[show destroy]

  def index
    @mixes = Mix.all
  end

  def show

  end

  def new
    @mixes = Mix.new
    @sounds = Sound.all
  end

  def create
    @mixes = Mix.new(mix_params)
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
