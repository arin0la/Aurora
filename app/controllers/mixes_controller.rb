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

    respond_to do |format|

      if @mixes.save
        format.html # { redirect_to mix_path(@mixes) }
        format.json # TODO
      else
        format.html {render :new, status: :unprocessable_entity}
        format.json # TODO
      end
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
