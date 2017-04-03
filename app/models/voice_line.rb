class VoiceLine < ApplicationRecord
  require "voice"

  scope :generic, ->() { where(mission_id: nil) }
  scope :for_mission, ->(mission) { where("mission_id = ?",mission).order(mission_id: :asc) }

  def say
    Voice.write(self.line,self.id)
  end

  def options
    self[:lines].split("|")
  end

  def line
    self.options.sample
  end
end
