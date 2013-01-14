class Latest < Distribute
  def distribute!
    setup_branch
    push
  end

  def type
    "latest"
  end
end
