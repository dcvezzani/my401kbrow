class BcmsMy401k::Layout < ActiveRecord::Base
  acts_as_content_block

  has_attachment :preview
end
