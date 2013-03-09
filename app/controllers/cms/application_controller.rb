module Cms
class ApplicationController < ::ApplicationController
  include Cms::Authentication::Controller
  include Cms::ErrorHandling
  include Cms::DomainSupport

  helper Cms::ApplicationHelper
  helper Cms::FormTagHelper
  include Cms::PathHelper
  helper Cms::PathHelper
  include Cms::PageHelper
  helper Cms::PageHelper
  helper Cms::MenuHelper
  helper Cms::RenderingHelper
  helper Cms::UiElementsHelper

  before_filter :load_cms_site
  #before_filter :current_site
 
  # before_filter :load_cms_page,
  #   :only => :render_page
  
  protected
    def escape_javascript(javascript)
      (javascript || '').gsub('\\','\0\0').gsub('</','<\/').gsub(/\r\n|\n|\r/, "\\n").gsub(/["']/) { |m| "\\#{m}" }
    end
  
    def redirect_to_first(*urls)
      urls.each do |url|
        unless url.blank?
          return redirect_to(url)
        end
      end
    end
    
    # def current_site
    #   debugger
    #   # @current_site ||= Site.find_by_domain(request.host_with_port.downcase)
    #   @current_site ||= Site.find_site(request.host_with_port.downcase, request.fullpath)
    #   puts ">>> it worked... so far (#{@current_site.name}, #{@current_site.domain}, '#{@current_site.path}')"
    # end

    def load_cms_site
      # debugger
      @cms_site ||= if params[:site_id]
        Cms::Site.find_by_id(params[:site_id])
      else
        Cms::Site.find_site(request.host_with_port.downcase, request.fullpath)
      end
      puts ">>> it worked... so far (#{@cms_site.name}, #{@cms_site.domain}, '#{@cms_site.path}')"
      
      if @cms_site
        if params[:path].present?
          params[:path].gsub!(/^#{@cms_site.path}/, '')
          params[:path].to_s.gsub!(/^\//, '')
        end
        I18n.locale = @cms_site.locale
      else
        I18n.locale = I18n.default_locale
        raise ActionController::RoutingError.new('Site Not Found')
      end
    end
   
    # def load_cms_page
    #   @cms_page = @cms_site.pages.published.find_by_full_path!("/#{params[:cms_path]}")
    #   # return redirect_to(@cms_page.target_page.url) if @cms_page.target_page
    #   
    # rescue ActiveRecord::RecordNotFound
    #   if @cms_page = @cms_site.pages.published.find_by_full_path('/404')
    #     render_page(404)
    #   else
    #     raise ActionController::RoutingError.new('Page Not Found')
    #   end
    # end
    
     
    def redirect_to_cms_site
      if using_cms_subdomains? && !request_is_for_cms_subdomain?
        redirect_to(url_with_cms_domain_prefix)
      end
    end 
  
    def append_to_query_string(url, *params)
      new_url = url["?"] ? url : "#{url}?"
      new_url << params.map{|k,v| "#{k.to_s}=#{CGI::escape(v.to_s)}"}.join("&")
    end
  
    def cms_access_required
      raise Cms::Errors::AccessDenied unless current_user.able_to?(:super_administrate, :administrate, :edit_content, :publish_content)
    end
  
    def self.check_permissions(*perms)
      opts = Hash === perms.last ? perms.pop : {}
      before_filter(opts) do |controller|
        raise Cms::Errors::AccessDenied unless controller.send(:current_user).able_to?(*perms)
      end      
    end
  
    def url_with_cms_domain_prefix
      if cms_site?
        request.url
      elsif request.subdomains.first == "www"
        request.url.sub(/www\./, "#{cms_domain_prefix}.")
      else
        request.url.sub(/:\/\//, "://#{cms_domain_prefix}.")
      end
    end
  
    def url_without_cms_domain_prefix
      request.url.sub(/#{cms_domain_prefix}\./,'')
    end
 
    # def load_cms_site
    #   @cms_site ||= if params[:site_id]
    #     Cms::Site.find_by_id(params[:site_id])
    #   else
    #     Cms::Site.find_site(request.host_with_port.downcase, request.fullpath)
    #   end
    #   
    #   if @cms_site
    #     if params[:cms_path].present?
    #       params[:cms_path].gsub!(/^#{@cms_site.path}/, '')
    #       params[:cms_path].to_s.gsub!(/^\//, '')
    #     end
    #     I18n.locale = @cms_site.locale
    #   else
    #     I18n.locale = I18n.default_locale
    #     raise ActionController::RoutingError.new('Site Not Found')
    #   end
    # end
    
end
end
