class Tag < ActsAsTaggableOn::Tag
  def to_param
    name
  end
end
