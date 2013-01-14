class Distribute
  class Command < Struct.new(:command)
    def send!
      `#{command}`
    end
  end
end
