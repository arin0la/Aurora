class VideosController < ApplicationController
  def index
    @videos = Video.all
    @mixes = Mix.all
  end

  def video_params
    params.require(:video).permit(:video)
  end
end
