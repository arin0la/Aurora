require "json"

class MixesController < ApplicationController
  before_action :set_mix, only: %i[show destroy]
  attr_accessor :vols

  def index
    @mixes = Mix.all
  end

  def show

  end

  def new
    @mixes = Mix.new
    @sounds = Sound.all
    @vols_hash = {}
  end

  def create
    @mixes = Mix.new(mix_params)
    vols_hash = JSON.parse(params["mix"]["vols"])
    @mixes.user = current_user
    if @mixes.save!
      vols_hash.each do |key, value|
        if value > 0
          mixsound = MixSound.new(volume: (value * 100))
          mixsound.mix = @mixes
          mixsound.sound = Sound.find(key.to_i)
          mixsound.save!
        end
      end
      redirect_to mix_path(@mixes)
    else
      raise
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
    # this extra slice is necessary so that we don't get an error
    # from the unpermitted "vols" parameter
    params.require(:mix).slice(:name).permit(:name)
  end

end
