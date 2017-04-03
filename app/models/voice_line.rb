class VoiceLine < ApplicationRecord
  require "voice"

  validates :name, presence: true
  validates :lines, presence: true

  scope :generic, ->() { where(mission_id: nil) }
  scope :for_mission, ->(mission) { where("mission_id = ?",mission).order(mission_id: :asc) }

  def say
    Voice.clean
    Voice.write(self.line,self.filename)
  end

  def options
    self[:lines].split("|")
  end

  def line
    self.options.sample
  end

  def filename
    "VoiceLine_#{self.id}.wav"
  end
end
