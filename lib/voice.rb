class Voice

  def self.say(message)
    %x(espeak -p 70 -s 160 -ven-rp+m7  "#{message}")
  end

end
