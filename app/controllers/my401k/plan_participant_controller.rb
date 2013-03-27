class My401k::PlanParticipantController < ApplicationController
  layout "my401k/plan_participant"
  include Cms::Acts::ContentPage

  def show_all_re_about_plan
  end

  def show_all_re_manage_account
  end

  def show_all_re_helpful_resources
  end

  def show_all_re_blog
  end

  def show_all_re_special_offers
  end

  def show_article
    render layout: "my401k/plan_participant/plan_participant_wide"
  end

  def show_blog_post
    render layout: "my401k/plan_participant/plan_participant_wide"
  end
end
