class My401k::GuestController < ApplicationController
  layout "my401k/guest"
  include Cms::Acts::ContentPage
  
  def pricing_and_support
    if(logged_in? and current_user.able_to?('administrate'))
      redirect_to '/my401k/plan_sponsor'
    else
      render 'my401k/guest/pricingsupport-alt'
    end
  end

  def welcome
    begin
      Cloudinary::Uploader.upload(params[:file], tags: 'my401k')
      render json: {msg: "file was uploaded!"}

    rescue => e
      Rails.logger.error(e.message)
      Rails.logger.error(e.backtrace)

      render json: {msg: "file was not uploaded"}, status: :unprocessable_entity
    end
  end
end
