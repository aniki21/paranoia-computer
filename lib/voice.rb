class Voice

  def self.say(message)
    %x(espeak -p 70 -s 160 -ven-rp+m7  "#{message}")
  end

  def self.write(message,filename=nil)
    filename ||= "#{message.parameterize}.wav"
    dir = File.join(Rails.root,"public","clips")
    %x(espeak -p 70 -s 160 -ven-rp+m7 -w #{File.join(dir,filename)} "#{message}")
    return filename
  end

end
