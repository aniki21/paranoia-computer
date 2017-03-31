class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :fetch_missions

  private
  def fetch_missions
    @missions = VoiceLine.where.not(mission_id: nil).group(:mission_id).count.map{|a,b| a }
  end
end
