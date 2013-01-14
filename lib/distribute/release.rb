class Release < Distribute
  def distribute!
    setup_branch
    tag_branch
    push
  end

  def type
    "release"
  end

  private

  def tag_branch
    Command.new("git tag release-v#{version}").send!
  end
end
