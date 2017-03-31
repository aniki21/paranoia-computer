class VoiceLinesController < ApplicationController
  def index
    @generic_lines = VoiceLine.generic
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    line = VoiceLine.find_by_id(params[:id])
    line.destroy if line.present?
    redirect_to voice_lines_path and return
  end

  def say
    if params[:l].present?
      line = VoiceLine.find_by_id(params[:l])
      unless line.blank?
        line.say
      else
        Voice.say("Response not found")
      end
    end

    if params[:m].present?
      Voice.say(params[:m])
    end
    render text: "playing"
  end

end
