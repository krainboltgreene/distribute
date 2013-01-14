class Release < Distribute
  @@type = "release"

  def distribute!
    setup_branch
    tag_branch
    push
  end

  private

  def tag_branch
    Command.new("git tag release-v#{version}").send!
  end
end
