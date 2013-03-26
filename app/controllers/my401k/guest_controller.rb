class My401k::GuestController < ApplicationController
  layout "my401k/guest"
  include Cms::Acts::ContentPage

  def welcome
  end
end
