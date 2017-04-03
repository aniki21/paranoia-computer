class Voice
  @@dir = File.join(Rails.root,"public","clips")

  def self.say(message)
    %x(espeak -p 70 -s 160 -ven-rp+m7  "#{message}")
  end

  def self.write(message,filename=nil)
    message = message.gsub(/\|/, "! ")
    filename ||= "#{message.parameterize}.wav"
    filename = "#{Time.now.to_i}_#{filename}"
    %x(espeak -p 70 -s 160 -ven-rp+m7 -w #{File.join(@@dir,filename)} "#{message}")
    return filename
  end

  def self.clean
    %x(rm #{@@dir}/*.wav)
  end

end
