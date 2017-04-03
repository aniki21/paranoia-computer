class Voice

  def self.say(message)
    %x(espeak -p 70 -s 160 -ven-rp+m7  "#{message}")
  end


  def self.write(message,filename=nil)
    filename ||= File.join(message.parameterize,".wav")
    %x(espeak -p 70 -s 160 -ven-rp+m7 -w #{File.join(Rails.root,"public","clips",filename)} "#{message}")
  end

end
