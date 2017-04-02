class VoiceLinesController < ApplicationController
  # GET /voice_lines
  def index
    @generic_lines = VoiceLine.generic
  end
  
  # POST /voice_lines
  def create
    line = VoiceLine.new(line_params)
    if line.save
      flash[:success] = "New line '#{line.name}' saved"
    else
      flash[:error] = line.errors.full_messages.to_sentence
    end
    redirect_to voice_lines_path and return
  end

  # POST /voice_lines/:id
  def update
    line = VoiceLine.find_by_id(params[:id])
    if line.update_attributes(line_params)
      flash[:success] = "Line '#{line.name}' updated"
    else
      flash[:error] = line.errors.full_messages.to_sentence
    end
    redirect_to voice_lines_path and return
  end

  # DELETE /voice_lines/:id
  def destroy
    line = VoiceLine.find_by_id(params[:id])
    line.destroy if line.present?
    redirect_to voice_lines_path and return
  end

  # GET|POST /voice_lines/say
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
    render plain: "playing"
  end

  private
  def line_params
    params.require(:voice_line).permit(:name,:lines,:button_class, :mission_id)
  end

end
