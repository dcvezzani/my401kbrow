class My401k::AdminController < ApplicationController
  layout "my401k"
  include Cms::Authentication::Controller

  before_filter :login_required
end
