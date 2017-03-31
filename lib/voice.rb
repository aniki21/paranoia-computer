class Voice

  def self.say(message)
    %x(espeak "#{message}")
  end

end
