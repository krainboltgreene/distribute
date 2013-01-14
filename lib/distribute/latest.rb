class Distribute
  class Latest < Distribute
    @@type = "latest"

    def distribute!
      setup_branch
      push
    end
  end
end
