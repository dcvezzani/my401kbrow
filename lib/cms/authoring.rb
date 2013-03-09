# I'm not sure why this file isn't getting loaded so that BrowserCms settings are overridden
# dcv; Fri Mar  8 18:27:41 PST 2013

module Cms::Authoring

  # Represents the common permissions that are common for CMS operations.
  PERMISSIONS = [:edit_content, :administrate, :publish_content]

  # Represents the common permissions for CMS super administrator operations.
  SUPER_PERMISSIONS = [:edit_content, :super_administrate, :administrate, :publish_content]

  # A full fledged editor can do these things.
  EDITOR_PERMISSIONS = [:edit_content, :publish_content]

end
