class VoiceLine < ApplicationRecord
  require "voice"

  validates :name, presence: true
  validates :lines, presence: true

  scope :generic, ->() { where(mission_id: nil) }
  scope :for_mission, ->(mission) { where("mission_id = ?",mission).order(mission_id: :asc) }

  before_create :set_position

  def say
    # Voice.clean
    # Voice.write(self.line,self.filename)
  end

  def options
    self[:lines].split("|")
  end

  def line
    self.options.sample
  end

  def filename
    # "VoiceLine_#{self.id}.wav"
  end

  private
  def set_position
    return if self.position.present?
    self.position = (self.mission_id.present? ? VoiceLine.for_mission(self.mission_id).count : VoiceLine.generic.count) + 1
  end
end
