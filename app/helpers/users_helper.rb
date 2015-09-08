module UsersHelper
  def gravatar_for(user)
    size = User::DEFAULT_PICTURE_SIZE
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag(gravatar_url, alt: user.display_name, class: "avatar")
  end

  def link_avatar_and_username(user)
    link_to user do
      gravatar_for(user) +
        content_tag(:h4, user.display_name)
    end
  end
end
