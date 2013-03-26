class My401k::GuestController < ApplicationController
  layout "my401k/guest"
  include Cms::Acts::ContentPage
  
  def pricing_and_support
    render 'my401k/guest/pricingsupport-alt'
  end
  def welcome
  end
end
